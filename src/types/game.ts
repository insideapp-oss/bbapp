import type { CompetitionGroup } from "./competition"
import type { Team } from "./team"
import type { Venue } from "./location"

export interface Game {
  id: string
  group: CompetitionGroup
  /** Unix timestamp in milliseconds */
  startTime: number
  team1: Team
  team2: Team
  played: boolean
  snapshotRequested: boolean
  team1Score?: number
  team2Score?: number
  venue?: Venue
  period?: number
}

export function gameDate(game: Game): Date {
  return new Date(game.startTime)
}

export function gameWinner(game: Game): "team1" | "team2" | "tie" | null {
  if (game.team1Score == null || game.team2Score == null) return null
  if (game.team1Score > game.team2Score) return "team1"
  if (game.team2Score > game.team1Score) return "team2"
  return "tie"
}
