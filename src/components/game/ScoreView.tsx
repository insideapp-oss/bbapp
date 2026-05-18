interface ScoreViewProps {
  score: number
  isWinner?: boolean
}

export function ScoreView({ score, isWinner = false }: ScoreViewProps) {
  return (
    <span
      className={`text-xl font-montserrat ${isWinner ? "font-bold text-text-primary" : "font-normal text-text-secondary"}`}
    >
      {score}
    </span>
  )
}
