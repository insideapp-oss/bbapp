import type { Game } from "../../types"
import { gameDate, gameWinner } from "../../types"
import { TeamView } from "../team/TeamView"
import { VenueBar } from "./VenueBar"
import { ScoreView } from "./ScoreView"
import { WinnerEdgeStrip } from "./WinnerEdgeStrip"

interface GameCardProps {
  game: Game
  forceUpcoming?: boolean
}

export function GameCard({ game, forceUpcoming = false }: GameCardProps) {
  const date = gameDate(game)
  const day = date.toLocaleString("fr-FR", { day: "numeric" })
  const month = date.toLocaleString("fr-FR", { month: "short" })
  const time = date.toLocaleString("fr-FR", { hour: "2-digit", minute: "2-digit" })
  const shortDate = date.toLocaleString("fr-FR", { month: "short", day: "numeric" })

  const isPast = !forceUpcoming && game.played && game.team1Score != null && game.team2Score != null
  const winner = gameWinner(game)

  const accessibilityLabel = isPast
    ? `${game.team1.name} ${game.team1Score ?? 0} - ${game.team2Score ?? 0} ${game.team2.name}. ${shortDate}`
    : `${game.team1.name} vs ${game.team2.name}, ${month} ${day} à ${time}`

  return (
    <article
      className="relative overflow-hidden rounded-[var(--radius-card)] shadow-sm h-[130px] flex flex-col"
      style={{
        background: "linear-gradient(to right, rgba(212,171,55,0.03), rgba(212,171,55,0.12))",
      }}
      aria-label={accessibilityLabel}
    >
      {/* Winner edge strip */}
      {isPast && winner === "team1" && <WinnerEdgeStrip side="left" />}
      {isPast && winner === "team2" && <WinnerEdgeStrip side="right" />}

      {/* Main content */}
      <div className="flex items-center gap-4 px-4 pt-4 flex-1">
        {/* Team 1 */}
        <div className="flex-1 flex justify-center">
          <TeamView team={game.team1} size="medium" bold={winner === "team1"} />
        </div>

        {/* Center */}
        <div className="flex flex-col items-center gap-1 px-2">
          {isPast ? (
            <>
              <div className="flex items-center gap-1">
                <ScoreView score={game.team1Score!} isWinner={winner === "team1"} />
                <span className="text-xl font-bold text-text-secondary">-</span>
                <ScoreView score={game.team2Score!} isWinner={winner === "team2"} />
              </div>
              <span className="text-xs text-text-primary bg-medium-gray/10 px-2 py-0.5 rounded-full">
                {shortDate}
              </span>
            </>
          ) : (
            <>
              <span className="text-2xl font-bold text-text-primary leading-tight">{day}</span>
              <span className="text-xs text-text-secondary">{month}</span>
              <span className="text-xs text-white font-medium bg-tertiary-gold px-2 py-0.5 rounded-full mt-1">
                {time}
              </span>
            </>
          )}
        </div>

        {/* Team 2 */}
        <div className="flex-1 flex justify-center">
          <TeamView team={game.team2} size="medium" bold={winner === "team2"} />
        </div>
      </div>

      {/* Venue strip */}
      {game.venue && <VenueBar venue={game.venue} />}
    </article>
  )
}
