/**
 * SuggestionBoard — S465. The public board of reader suggestions.
 *
 * Yoshi's decisions (2026-10-24):
 *  - No names: "User suggestion" for readers, "Creator" for Yoshi.
 *  - Posts appear only after the creator approves them (store moderation
 *    rules); the poster's own posts show to them as "Yours" with a show /
 *    hide switch and their approval state.
 *  - Anonymous thumbs up / down. Only the up count is shown; the down
 *    count reads "Count hidden" so nobody is afraid to press it.
 *  - "Liked by the creator" when Yoshi thumbs-up a post.
 *  - Status: Planned / Built / Taking into consideration; Built links to
 *    its New Features entry. Creator's note sits under the reader's words.
 *  - Partners can comment a tweak on any suggestion; comments are moderated
 *    the same way (approve-before-public) and are not voted on.
 *  - Free readers see the board but cannot vote or suggest. Report is
 *    open to every signed-in reader.
 */
import { useCallback, useEffect, useState } from "react";
import {
  addBoardComment,
  getBoard,
  moderatePost,
  reportPost,
  setPostVisibility,
  voteOnPost,
  type BoardComment,
  type BoardPost,
  type BoardResponse,
  type BoardStatus,
} from "../lib/api";
import { isNativeShell } from "../lib/native-shell";

const STATUS_LABEL: Record<BoardStatus, string> = {
  planned: "Planned",
  built: "Built",
  considering: "Taking into consideration",
};

const KIND_LABEL: Record<string, string> = {
  feature: "Missing feature",
  improvement: "Make it better",
  problem: "Something's not working",
};

export default function SuggestionBoard() {
  const [data, setData] = useState<BoardResponse | null>(null);
  const [failed, setFailed] = useState(false);

  const load = useCallback(() => {
    getBoard()
      .then((d) => { setData(d); setFailed(false); })
      .catch(() => setFailed(true));
  }, []);

  useEffect(() => {
    load();
    const h = () => load();
    window.addEventListener("rop-board-refresh", h);
    return () => window.removeEventListener("rop-board-refresh", h);
  }, [load]);

  return (
    <section
      id="board"
      className="rounded-md border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-4"
    >
      <h2 className="text-base font-semibold text-[var(--reader-text)]">Suggestion Board</h2>
      <p className="mt-1 font-sans text-sm text-[var(--reader-muted)]">
        Ideas from readers and from the app creator. Partners can vote
        on any of them. No names are shown, and votes are anonymous.
      </p>

      {data && !data.can_vote && (
        <p className="mt-3 rounded border border-[var(--reader-rule)] px-3 py-2 font-sans text-sm text-[var(--reader-muted)]">
          🔒 Voting and suggesting are for partners. Even one month of
          partnership gives you a voice in what gets built next.
          {isNativeShell()
            ? " Partnership is managed from your account on the web at remnantofpromise.org."
            : null}
        </p>
      )}

      {!data && !failed && (
        <p className="mt-3 font-sans text-xs italic text-[var(--reader-muted)]">Loading…</p>
      )}
      {failed && (
        <p className="mt-3 font-sans text-sm text-[var(--reader-muted)]">
          The board couldn't load right now. Please try again in a moment.
        </p>
      )}
      {data && data.posts.length === 0 && (
        <p className="mt-3 font-sans text-sm text-[var(--reader-muted)]">No suggestions on the board yet.</p>
      )}

      <ul className="mt-4 space-y-3">
        {data?.posts.map((p) => (
          <PostCard key={p.id} post={p} board={data} onChanged={load} />
        ))}
      </ul>

      <p className="mt-4 font-sans text-xs text-[var(--reader-muted)]">
        Every post is moderated. To raise a concern about anything on the board,
        tap Report on the post or write to info@remnantofpromise.org.
      </p>
    </section>
  );
}

function PostCard({
  post,
  board,
  onChanged,
}: {
  post: BoardPost;
  board: BoardResponse;
  onChanged: () => void;
}) {
  const [ups, setUps] = useState(post.ups);
  const [myVote, setMyVote] = useState<number>(post.my_vote);
  const [busy, setBusy] = useState(false);
  const [reported, setReported] = useState(false);
  const [noteDraft, setNoteDraft] = useState(post.creator_note ?? "");
  const [featureDraft, setFeatureDraft] = useState(post.feature_id ?? "");
  const [commentOpen, setCommentOpen] = useState(false);
  const [commentDraft, setCommentDraft] = useState("");
  const [commentSent, setCommentSent] = useState(false);

  async function sendComment() {
    if (commentDraft.trim().length < 2 || busy) return;
    setBusy(true);
    try {
      await addBoardComment(post.id, commentDraft.trim());
      setCommentDraft("");
      setCommentOpen(false);
      setCommentSent(true);
      onChanged();
    } finally {
      setBusy(false);
    }
  }

  useEffect(() => { setUps(post.ups); setMyVote(post.my_vote); }, [post.ups, post.my_vote]);

  async function vote(v: -1 | 1) {
    if (!board.can_vote || busy) return;
    const next = (myVote === v ? 0 : v) as -1 | 0 | 1;
    setBusy(true);
    try {
      const r = await voteOnPost(post.id, next);
      setUps(r.ups);
      setMyVote(next);
      if (board.is_creator) onChanged();
    } finally {
      setBusy(false);
    }
  }

  async function toggleVisibility() {
    if (busy) return;
    setBusy(true);
    try {
      await setPostVisibility(post.id, !post.show_on_board);
      onChanged();
    } finally {
      setBusy(false);
    }
  }

  async function report() {
    const reason = window.prompt("What's wrong with this post? (optional)") ;
    if (reason === null) return;
    await reportPost(post.id, reason);
    setReported(true);
  }

  async function mod(input: Parameters<typeof moderatePost>[1]) {
    setBusy(true);
    try {
      await moderatePost(post.id, input);
      onChanged();
    } finally {
      setBusy(false);
    }
  }

  const pill = "rounded border px-2 py-0.5 font-sans text-xs";
  const btn =
    "rounded border border-[var(--reader-rule)] px-3 py-1 font-sans text-sm text-[var(--reader-text)] disabled:opacity-40";

  return (
    <li className="rounded border border-[var(--reader-rule)] px-3 py-3">
      <div className="flex flex-wrap items-center gap-2 font-sans text-xs text-[var(--reader-muted)]">
        <span className={post.is_creator_post ? "font-semibold text-[var(--reader-accent)]" : ""}>
          {post.author}
        </span>
        <span>· {KIND_LABEL[post.kind] ?? post.kind}</span>
        {post.mine && <span className={pill + " border-[var(--reader-accent)]"}>Yours</span>}
        {post.status && (
          <span className={pill + " border-[var(--reader-rule)] text-[var(--reader-text)]"}>
            {post.status === "built" && post.feature_id ? (
              <a href={`/new-features#${post.feature_id}`} className="underline">Built — see what's new</a>
            ) : (
              STATUS_LABEL[post.status]
            )}
          </span>
        )}
        {post.creator_liked && (
          <span className={pill + " border-[var(--reader-accent)] text-[var(--reader-accent)]"}>
            ♥ Liked by the app creator
          </span>
        )}
      </div>

      <p className="mt-2 whitespace-pre-wrap text-sm text-[var(--reader-text)]">{post.body}</p>

      {post.creator_note && (
        <div className="mt-2 border-l-2 border-[var(--reader-accent)] pl-3">
          <p className="font-sans text-xs font-semibold text-[var(--reader-accent)]">App creator's note</p>
          <p className="whitespace-pre-wrap text-sm text-[var(--reader-text)]">{post.creator_note}</p>
        </div>
      )}

      {(post.mine || board.is_creator) && post.approval && post.approval !== "approved" && (
        <p className="mt-2 font-sans text-xs italic text-[var(--reader-muted)]">
          {post.approval === "pending"
            ? "Waiting to be read before it goes up on the board."
            : "Not shown on the board."}
        </p>
      )}

      <div className="mt-3 flex flex-wrap items-start gap-3">
        <div className="flex flex-col items-center">
          <button
            type="button"
            onClick={() => vote(1)}
            disabled={!board.can_vote || busy}
            aria-pressed={myVote === 1}
            aria-label="Thumbs up"
            className={btn + (myVote === 1 ? " border-[var(--reader-accent)] bg-[var(--reader-accent)] text-[var(--reader-bg)]" : "")}
          >
            👍 {ups}
          </button>
        </div>
        <div className="flex flex-col items-center">
          <button
            type="button"
            onClick={() => vote(-1)}
            disabled={!board.can_vote || busy}
            aria-pressed={myVote === -1}
            aria-label="Thumbs down"
            className={btn + (myVote === -1 ? " border-[var(--reader-accent)] bg-[var(--reader-accent)] text-[var(--reader-bg)]" : "")}
          >
            👎{board.is_creator && post.downs !== null ? ` ${post.downs}` : ""}
          </button>
          <span className="mt-0.5 font-sans text-[10px] text-[var(--reader-muted)]">
            {board.is_creator ? "Only you see this" : "Count hidden"}
          </span>
        </div>

        {board.can_post && post.approval !== "pending" && (
          <button type="button" onClick={() => setCommentOpen((v) => !v)} className={btn}>
            💬 Comment or tweak
          </button>
        )}
        {post.mine && (
          <button type="button" onClick={toggleVisibility} disabled={busy} className={btn}>
            {post.show_on_board ? "Hide from the board" : "Show on the board"}
          </button>
        )}
        {board.signed_in && !post.mine && !post.is_creator_post && (
          <button type="button" onClick={report} disabled={reported} className={btn}>
            {reported ? "Reported — thank you" : "Report"}
          </button>
        )}
      </div>

      {post.comments.length > 0 && (
        <ul className="mt-3 space-y-2 border-l border-[var(--reader-rule)] pl-3">
          {post.comments.map((c) => (
            <CommentRow key={c.id} c={c} board={board} onChanged={onChanged} />
          ))}
        </ul>
      )}

      {commentOpen && (
        <div className="mt-3 space-y-2">
          <textarea
            value={commentDraft}
            onChange={(e) => setCommentDraft(e.target.value)}
            maxLength={2000}
            rows={3}
            placeholder="Add a comment, or a tweak that would make this idea better"
            className="w-full rounded border border-[var(--reader-rule)] bg-transparent px-3 py-2 text-sm text-[var(--reader-text)]"
          />
          <button type="button" onClick={sendComment} disabled={busy || commentDraft.trim().length < 2} className={btn}>
            Send comment
          </button>
        </div>
      )}
      {commentSent && !board.is_creator && (
        <p className="mt-2 font-sans text-xs italic text-[var(--reader-muted)]">
          Thank you. Your comment shows here once it has been read, the same as suggestions.
        </p>
      )}

      {board.is_creator && (
        <div className="mt-3 space-y-2 border-t border-[var(--reader-rule)] pt-3">
          <p className="font-sans text-xs font-semibold text-[var(--reader-muted)]">App creator tools</p>
          <div className="flex flex-wrap gap-2">
            {!post.is_creator_post && (
              <>
                <button type="button" className={btn} disabled={busy || post.approval === "approved"} onClick={() => mod({ approval: "approved" })}>Approve</button>
                <button type="button" className={btn} disabled={busy || post.approval === "hidden"} onClick={() => mod({ approval: "hidden" })}>Hide</button>
              </>
            )}
            {(["planned", "considering", "built"] as BoardStatus[]).map((s) => (
              <button key={s} type="button" className={btn + (post.status === s ? " border-[var(--reader-accent)]" : "")} disabled={busy} onClick={() => mod({ status: post.status === s ? "none" : s })}>
                {STATUS_LABEL[s]}
              </button>
            ))}
          </div>
          {post.status === "built" && (
            <div className="flex gap-2">
              <input
                value={featureDraft}
                onChange={(e) => setFeatureDraft(e.target.value)}
                placeholder="New Features entry id (e.g. suggestion-board)"
                className="flex-1 rounded border border-[var(--reader-rule)] bg-transparent px-2 py-1 font-sans text-sm text-[var(--reader-text)]"
              />
              <button type="button" className={btn} disabled={busy} onClick={() => mod({ feature_id: featureDraft })}>Link</button>
            </div>
          )}
          {(
            <div>
              <textarea
                value={noteDraft}
                onChange={(e) => setNoteDraft(e.target.value)}
                rows={2}
                placeholder="App creator's note — shows under the post, never changes its words"
                className="w-full rounded border border-[var(--reader-rule)] bg-transparent px-2 py-1 text-sm text-[var(--reader-text)]"
              />
              <button type="button" className={btn} disabled={busy} onClick={() => mod({ creator_note: noteDraft })}>Save note</button>
            </div>
          )}
        </div>
      )}
    </li>
  );
}

function CommentRow({
  c,
  board,
  onChanged,
}: {
  c: BoardComment;
  board: BoardResponse;
  onChanged: () => void;
}) {
  const [busy, setBusy] = useState(false);
  const [reported, setReported] = useState(false);
  const small =
    "rounded border border-[var(--reader-rule)] px-2 py-0.5 font-sans text-xs text-[var(--reader-text)] disabled:opacity-40";

  async function run(fn: () => Promise<unknown>) {
    setBusy(true);
    try { await fn(); onChanged(); } finally { setBusy(false); }
  }

  return (
    <li>
      <p className="font-sans text-xs text-[var(--reader-muted)]">
        <span className={c.is_creator_post ? "font-semibold text-[var(--reader-accent)]" : ""}>{c.author}</span>
        {c.mine && <span className="ml-2 rounded border border-[var(--reader-accent)] px-1.5">Yours</span>}
      </p>
      <p className="whitespace-pre-wrap text-sm text-[var(--reader-text)]">{c.body}</p>
      {(c.mine || board.is_creator) && c.approval && c.approval !== "approved" && (
        <p className="font-sans text-xs italic text-[var(--reader-muted)]">
          {c.approval === "pending" ? "Waiting to be read before it shows." : "Not shown."}
        </p>
      )}
      <div className="mt-1 flex flex-wrap gap-2">
        {c.mine && (
          <button type="button" className={small} disabled={busy} onClick={() => run(() => setPostVisibility(c.id, !c.show_on_board))}>
            {c.show_on_board ? "Hide" : "Show"}
          </button>
        )}
        {board.signed_in && !c.mine && !c.is_creator_post && (
          <button
            type="button"
            className={small}
            disabled={reported}
            onClick={async () => {
              const reason = window.prompt("What's wrong with this comment? (optional)");
              if (reason === null) return;
              await reportPost(c.id, reason);
              setReported(true);
            }}
          >
            {reported ? "Reported" : "Report"}
          </button>
        )}
        {board.is_creator && !c.is_creator_post && (
          <>
            <button type="button" className={small} disabled={busy || c.approval === "approved"} onClick={() => run(() => moderatePost(c.id, { approval: "approved" }))}>Approve</button>
            <button type="button" className={small} disabled={busy || c.approval === "hidden"} onClick={() => run(() => moderatePost(c.id, { approval: "hidden" }))}>Hide</button>
          </>
        )}
      </div>
    </li>
  );
}
