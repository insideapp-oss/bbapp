import { GameCard } from "../components/game/GameCard"
import { mockGames } from "../data/mockGames"

export function GamesPage() {
  const upcoming = mockGames.filter((g) => !g.played)
  const past = mockGames.filter((g) => g.played)

  return (
    <div className="flex flex-col gap-6 p-4">
      {upcoming.length > 0 && (
        <section>
          <h2 className="text-base font-bold uppercase mb-3 text-text-primary">À venir</h2>
          <div className="flex flex-col gap-3">
            {upcoming.map((game) => (
              <GameCard key={game.id} game={game} />
            ))}
          </div>
        </section>
      )}

      {past.length > 0 && (
        <section>
          <h2 className="text-base font-bold uppercase mb-3 text-text-primary">Résultats</h2>
          <div className="flex flex-col gap-3">
            {past.map((game) => (
              <GameCard key={game.id} game={game} />
            ))}
          </div>
        </section>
      )}
    </div>
  )
}
