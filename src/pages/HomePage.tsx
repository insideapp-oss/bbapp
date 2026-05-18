import { FeaturedGameCard } from "../components/game/FeaturedGameCard"
import { GameCard } from "../components/game/GameCard"
import { featuredGame, mockGames } from "../data/mockGames"

export function HomePage() {
  const upcomingGames = mockGames.filter((g) => !g.played).slice(0, 5)

  return (
    <div className="flex flex-col gap-6 p-4">
      {/* Featured game */}
      <section>
        <h2 className="text-base font-bold uppercase mb-3 text-text-primary">Match à la une</h2>
        <FeaturedGameCard game={featuredGame} />
      </section>

      {/* Upcoming games */}
      <section>
        <h2 className="text-base font-bold uppercase mb-3 text-text-primary">Prochains matchs</h2>
        <div className="flex flex-col gap-3">
          {upcomingGames.map((game) => (
            <GameCard key={game.id} game={game} />
          ))}
        </div>
      </section>
    </div>
  )
}
