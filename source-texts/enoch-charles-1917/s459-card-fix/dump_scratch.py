import asyncio, asyncpg, json
async def main():
    con = await asyncpg.connect(host='/tmp', port=5499, user='postgres', database='postgres')
    V = """select v.id, e.slug ed, b.slug book, c.chapter_number ch, v.verse_number vn, v.text from verses v join chapters c on c.id=v.chapter_id join books b on b.id=c.book_id join editions e on e.id=b.edition_id"""
    enoch = {f"{r['ch']}:{r['vn']}": r['text'] for r in await con.fetch(V + " where e.slug='enoch' order by c.chapter_number, v.verse_number")}
    cards = [dict(r) for r in await con.fetch(f"""with vv as ({V}) select x.id, x.note, x.tier_required tier, x.source, s.ed s_ed, s.book s_book, s.ch s_ch, s.vn s_vn, s.text s_text, t.ed t_ed, t.book t_book, t.ch t_ch, t.vn t_vn, t.text t_text
        from cross_references x join vv s on s.id=x.source_verse_id join vv t on t.id=x.target_verse_id where s.ed='enoch' or t.ed='enoch' or x.note ilike '%enoch%' order by x.id""")]
    json.dump({"enoch_live": enoch, "cards": cards, "members": [], "threads": []}, open('enoch-cards-scratch.json','w'), ensure_ascii=False)
    await con.close()
asyncio.run(main())
