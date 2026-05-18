import type { Sport } from "./sport"
import type { Competition, CompetitionGroup } from "./competition"
import type { Venue, Location } from "./location"

export interface Club {
  id: string
  name: string
  sport: Sport
  countryCode: string
  websiteUrl?: string
  location?: Location
  venue?: Venue
  phoneNumber?: string
  email?: string
  color?: string
}

export interface Team {
  id: string
  name: string
  number?: number
  club: Club
  competition: Competition
  groups: CompetitionGroup[]
}
