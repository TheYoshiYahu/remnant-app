"""Seed a scratch Postgres (minimal schema) from the Oct 23 Jasher read-back: full live Jasher text, every live card touching it with ids,
stub verses for the other ends, every member row and thread touching it.  Writes seed463d.sql next to this file."""
import json
from pathlib import Path
HERE = Path(__file__).resolve().parent
d = json.load(open(HERE / 'in' / 'jasher-cards-live.json')); L = d['live']
def esc(s): return "E'" + (s or '').replace('\\', '\\\\').replace("'", "\\'") + "'"
out = ["""CREATE TYPE content_tier AS ENUM ('free','study_notes','extras','complete_study');
CREATE TABLE editions(id serial primary key, slug text);
CREATE TABLE books(id serial primary key, edition_id int references editions, slug text, title text, canonical_order int);
CREATE TABLE chapters(id serial primary key, book_id int references books, chapter_number int);
CREATE TABLE verses(id serial primary key, chapter_id int references chapters, verse_number int, text text);
CREATE TABLE cross_references(id bigint primary key, source_verse_id bigint not null references verses on delete restrict, target_verse_id bigint not null references verses on delete restrict, source text not null, note text, tier_required content_tier default 'free', CHECK (source_verse_id<>target_verse_id), unique(source_verse_id,target_verse_id,source));
CREATE TABLE cross_reference_threads(id int primary key, slug text, title text, summary_md text, sort_order int default 0, tier_required content_tier default 'free', anchor_verse_id_start bigint, anchor_verse_id_end bigint);
CREATE TABLE cross_reference_thread_members(thread_id int references cross_reference_threads on delete cascade, cross_reference_id bigint references cross_references on delete restrict, sort_order int default 0, member_note text, primary key(thread_id,cross_reference_id));
BEGIN;"""]
eds = {}
for c in d['cards']:
    for side in ('s', 't'): eds.setdefault(c[side + '_ed'], set()).add(c[side + '_book'])
for b in d['books']: eds.setdefault(b['ed'], set()).add(b['slug'])
for e in eds: out.append(f"INSERT INTO editions(slug) VALUES ('{e}');")
titles = {b['slug']: (b['title'], b['canonical_order']) for b in d['books']}
for e, bs in eds.items():
    for b in sorted(bs):
        t, o = titles.get(b, (b, 0))
        out.append(f"INSERT INTO books(edition_id,slug,title,canonical_order) SELECT id,'{b}',{esc(t)},{o} FROM editions WHERE slug='{e}';")
chs = sorted({int(a.split('|')[1].split(':')[0]) for a in L})
for ch in chs: out.append(f"INSERT INTO chapters(book_id,chapter_number) SELECT b.id,{ch} FROM books b JOIN editions e ON e.id=b.edition_id WHERE e.slug='jasher' AND b.slug='jasher';")
for a, t in L.items():
    b, cv = a.split('|'); ch, vn = cv.split(':')
    out.append(f"INSERT INTO verses(chapter_id,verse_number,text) SELECT c.id,{vn},{esc(t)} FROM chapters c JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='jasher' AND b.slug='jasher' AND c.chapter_number={ch};")
others = set()
for c in d['cards']:
    for side in ('s', 't'):
        if c[side + '_ed'] != 'jasher': others.add((c[side + '_ed'], c[side + '_book'], c[side + '_ch'], c[side + '_vn'], c[side + '_text']))
for e, b, ch in sorted({(o[0], o[1], o[2]) for o in others}): out.append(f"INSERT INTO chapters(book_id,chapter_number) SELECT b.id,{ch} FROM books b JOIN editions e ON e.id=b.edition_id WHERE e.slug='{e}' AND b.slug='{b}';")
for e, b, ch, vn, t in sorted(others): out.append(f"INSERT INTO verses(chapter_id,verse_number,text) SELECT c.id,{vn},{esc(t)} FROM chapters c JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='{e}' AND b.slug='{b}' AND c.chapter_number={ch};")
out.append("CREATE TEMP VIEW vv AS SELECT v.id, e.slug es, b.slug bs, c.chapter_number ch, v.verse_number vn FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id;")
for c in d['cards']:
    out.append(f"INSERT INTO cross_references(id,source_verse_id,target_verse_id,source,note,tier_required) SELECT {c['id']},s.id,t.id,'{c['source']}',{esc(c['note'])},'{c['tier']}' FROM vv s, vv t WHERE s.es='{c['s_ed']}' AND s.bs='{c['s_book']}' AND s.ch={c['s_ch']} AND s.vn={c['s_vn']} AND t.es='{c['t_ed']}' AND t.bs='{c['t_book']}' AND t.ch={c['t_ch']} AND t.vn={c['t_vn']};")
for t in d['threads']:
    anchor = f"(SELECT id FROM vv WHERE es='jasher' AND bs='jasher' AND ch={t['a_ch']} AND vn={t['a_vn']})" if t['a_ed'] == 'jasher' else "NULL"
    anchor_z = f"(SELECT id FROM vv WHERE es='jasher' AND bs='jasher' AND ch={t['z_ch']} AND vn={t['z_vn']})" if t['a_ed'] == 'jasher' and t['z_vn'] else "NULL"
    out.append(f"INSERT INTO cross_reference_threads(id,slug,title,summary_md,sort_order,tier_required,anchor_verse_id_start,anchor_verse_id_end) VALUES ({t['id']},{esc(t['slug'])},{esc(t['title'])},{esc(t['summary_md'])},{t['sort_order'] or 0},'{t['tier']}',{anchor},{anchor_z});")
seen = set(); card_ids = {c['id'] for c in d['cards']}
for m in d['members']:
    if (m['thread_id'], m['xref_id']) in seen or m['xref_id'] not in card_ids: continue
    seen.add((m['thread_id'], m['xref_id']))
    out.append(f"INSERT INTO cross_reference_threads(id,slug) VALUES ({m['thread_id']},{esc(m['slug'])}) ON CONFLICT DO NOTHING;")
    out.append(f"INSERT INTO cross_reference_thread_members(thread_id,cross_reference_id,sort_order,member_note) VALUES ({m['thread_id']},{m['xref_id']},{m['sort_order']},{esc(m['member_note'])});")
out.append("COMMIT;")
(HERE / 'seed463d.sql').write_text('\n'.join(out)); print(len(out), 'statements')
