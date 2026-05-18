import { useQuery } from "@tanstack/react-query"
import type { Game } from "../types"

async function fetchGames(): Promise<Game[]> {
  // TODO: replace with real API endpoint
  // const response = await fetch("/api/games")
  // return response.json()
  throw new Error("API not connected yet")
}

export function useGames() {
  return useQuery<Game[]>({
    queryKey: ["games"],
    queryFn: fetchGames,
    enabled: false, // disabled until API is configured
  })
}
