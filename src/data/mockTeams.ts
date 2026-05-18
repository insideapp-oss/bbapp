import type { Team } from "../types"

const competition = {
  id: "comp-1",
  name: "Betclic Elite",
  shortName: "Elite",
  sport: "basketball" as const,
  countryCode: "FR",
  gender: "male" as const,
  year: 2025,
}

const group = {
  id: "group-1",
  name: "Saison régulière",
  competition,
}

function makeTeam(id: string, name: string, color?: string): Team {
  return {
    id,
    name,
    club: { id: `club-${id}`, name, sport: "basketball", countryCode: "FR", color },
    competition,
    groups: [group],
  }
}

export const teams = {
  ASM: makeTeam("ASM", "AS Monaco", "#E8191A"),
  ASVEL: makeTeam("ASVEL", "Asvel", "#003189"),
  BCM: makeTeam("BCM", "Boulogne-Levallois", "#E3000F"),
  CHB: makeTeam("CHB", "Cholet Basket", "#003087"),
  CSP: makeTeam("CSP", "Limoges CSP", "#C8102E"),
  ELC: makeTeam("ELC", "Élan Chalon", "#E2001A"),
  JDA: makeTeam("JDA", "JDA Dijon", "#C8102E"),
  JLB: makeTeam("JLB", "JL Bourg", "#002D72"),
  LP: makeTeam("LP", "Le Portel", "#0057A8"),
  MSB: makeTeam("MSB", "Le Mans", "#D4AB37"),
  N92: makeTeam("N92", "Nanterre 92", "#C8102E"),
  PB: makeTeam("PB", "Paris Basketball", "#1A1A2E"),
  SIG: makeTeam("SIG", "Strasbourg IG", "#003189"),
  SLUC: makeTeam("SLUC", "SLUC Nancy", "#C8102E"),
  SQB: makeTeam("SQB", "Saint-Quentin", "#002D72"),
  STR: makeTeam("STR", "Metropolitans 92", "#E2001A"),
} satisfies Record<string, Team>
