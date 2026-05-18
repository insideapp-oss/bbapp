import type { Game } from "../types"
import { teams } from "./mockTeams"

const group = teams.ASM.groups[0]!

function makeGame(
  id: string,
  team1Key: keyof typeof teams,
  team2Key: keyof typeof teams,
  startTime: number,
  options?: { team1Score?: number; team2Score?: number; venueName?: string },
): Game {
  return {
    id,
    group,
    startTime,
    team1: teams[team1Key],
    team2: teams[team2Key],
    played: options?.team1Score != null,
    snapshotRequested: false,
    team1Score: options?.team1Score,
    team2Score: options?.team2Score,
    venue: options?.venueName
      ? { id: `venue-${id}`, name: options.venueName }
      : undefined,
  }
}

export const mockGames: Game[] = [
  makeGame("g1", "ASM", "ASVEL", 1_748_300_400_000, { venueName: "Salle Gaston Médecin" }),
  makeGame("g2", "BCM", "CHB", 1_748_386_800_000),
  makeGame("g3", "JLB", "MSB", 1_748_473_200_000, { venueName: "Ékinox" }),
  makeGame("g4", "N92", "SIG", 1_748_559_600_000, { venueName: "Palais des Sports" }),
  makeGame("g5", "CSP", "SLUC", 1_748_214_000_000, {
    team1Score: 88,
    team2Score: 79,
    venueName: "Palais des Sports de Beaublanc",
  }),
  makeGame("g6", "PB", "STR", 1_748_127_600_000, {
    team1Score: 92,
    team2Score: 85,
    venueName: "Adidas Arena",
  }),
  makeGame("g7", "ELC", "LP", 1_748_041_200_000, {
    team1Score: 74,
    team2Score: 74,
    venueName: "Axone",
  }),
]

export const featuredGame = mockGames[0]!
