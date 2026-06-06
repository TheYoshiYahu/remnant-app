/**
 * ReaderDivider — S201/S202 page-break ornament for the reading surface.
 *
 * "botanical" — gold vine, white blossoms, olive, grapes, pomegranates,
 * center menorah (Grok-generated, color-matched + cleaned at S202). Rendered
 * at full column width as the permanent end-of-scripture seam: it sits after
 * the chapter verses and before the study-tools toggle strip, so it stays
 * visible even when study aids / helpers / notes are hidden (Yoshi, S202).
 *
 * The asset is a rounded plaque: the ornament on a pure-#000 field with
 * rounded-corner transparency. On the black reader the field matches the
 * background, so the plaque vanishes and the ornament floats; on the
 * parchment light theme the same #000 field reads as an intentional rounded
 * dark band — and the (near-black) grapes stay perfect in both, since they
 * always sit on their black field rather than being keyed onto parchment.
 * One asset, correct in both themes. No theme swap needed.
 *
 * Purely decorative — `aria-hidden` + empty alt.
 *
 * (The "alephbet" variant was removed at S204 — the Grok paleo-Hebrew asset
 * was inaccurate and pulled at S202; a letterform-accurate rebuild would
 * re-add the variant.)
 */

interface ReaderDividerProps {
  variant: "botanical";
  /** Optional section label rendered beneath the ornament (major breaks). */
  label?: string;
}

const SRC: Record<ReaderDividerProps["variant"], string> = {
  botanical: "/dividers/divider-botanical-transparent.png",
};

export default function ReaderDivider({ variant, label }: ReaderDividerProps) {
  return (
    <div className="reader-divider my-8 text-center" role="presentation">
      <img
        src={SRC[variant]}
        alt=""
        aria-hidden="true"
        loading="lazy"
        decoding="async"
        className="mx-auto block h-auto w-full max-w-full"
      />
      {label && (
        <p className="mt-1 font-sans text-[11px] font-medium uppercase tracking-[0.22em] text-[var(--reader-muted)]">
          {label}
        </p>
      )}
    </div>
  );
}
