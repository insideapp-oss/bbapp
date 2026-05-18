import type { Game } from "../../types"
import { gameDate } from "../../types"
import { TeamView } from "../team/TeamView"
import { VenueBar } from "./VenueBar"

interface FeaturedGameCardProps {
  game: Game
}

export function FeaturedGameCard({ game }: FeaturedGameCardProps) {
  const date = gameDate(game)
  const day = date.toLocaleString("fr-FR", { day: "numeric" })
  const month = date.toLocaleString("fr-FR", { month: "short" })
  const time = date.toLocaleString("fr-FR", { hour: "2-digit", minute: "2-digit" })

  return (
    <article
      className="relative overflow-hidden rounded-[var(--radius-card)] shadow-md h-[200px] flex flex-col"
      style={{ background: "linear-gradient(to right, #da2f16, #a62818)" }}
      aria-label={`${game.team1.name} vs ${game.team2.name}, ${month} ${day} à ${time}${game.venue ? ` à ${game.venue.name}` : ""}`}
    >
      {/* Main content */}
      <div className="flex items-center gap-4 px-4 pt-4 flex-1">
        {/* Team 1 */}
        <div className="flex-1 flex justify-center">
          <TeamView team={game.team1} size="large" />
        </div>

        {/* Center: date + time */}
        <div className="flex flex-col items-center gap-3 px-4">
          <div className="flex flex-col items-center">
            <span className="text-2xl font-bold text-white leading-tight">{day}</span>
            <span className="text-xs text-white/80">{month}</span>
          </div>
          <span className="text-xs text-white font-medium bg-tertiary-gold px-3 py-1 rounded-full">
            {time}
          </span>
        </div>

        {/* Team 2 */}
        <div className="flex-1 flex justify-center">
          <TeamView team={game.team2} size="large" />
        </div>
      </div>

      {/* Venue strip */}
      {game.venue && <VenueBar venue={game.venue} dark />}
    </article>
  )
}
