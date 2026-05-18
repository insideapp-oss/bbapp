interface WinnerEdgeStripProps {
  side: "left" | "right"
}

export function WinnerEdgeStrip({ side }: WinnerEdgeStripProps) {
  return (
    <div
      className={`absolute top-0 bottom-0 w-1 rounded-full bg-tertiary-gold ${
        side === "left" ? "left-0" : "right-0"
      }`}
      aria-hidden="true"
    />
  )
}
