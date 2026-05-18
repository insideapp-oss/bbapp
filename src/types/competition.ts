import type { Sport } from "./sport"

export type CompetitionGender = "male" | "female" | "mixed"
export type CompetitionType = "league" | "cup" | "friendly"

export interface Competition {
  id: string
  name: string
  shortName?: string
  sport: Sport
  countryCode: string
  gender?: CompetitionGender
  category?: string
  type?: CompetitionType
  year?: number
}

export interface CompetitionPhase {
  name: string
  type?: string
}

export interface CompetitionGroup {
  id: string
  name: string
  competition: Competition
  phase?: CompetitionPhase
}
