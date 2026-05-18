import { TeamLogo } from "../components/team/TeamLogo"
import { teams } from "../data/mockTeams"

export function StandingsPage() {
  const teamList = Object.values(teams)

  return (
    <div className="p-4">
      <h2 className="text-base font-bold uppercase mb-3 text-text-primary">Classement</h2>
      <div className="flex flex-col gap-2">
        {teamList.map((team, index) => (
          <div
            key={team.id}
            className="flex items-center gap-3 bg-white rounded-[var(--radius-card)] px-4 py-3 shadow-sm"
          >
            <span className="w-6 text-center text-sm font-bold text-text-secondary">
              {index + 1}
            </span>
            <TeamLogo team={team} size="small" />
            <span className="flex-1 text-sm font-medium text-text-primary truncate">
              {team.name}
            </span>
          </div>
        ))}
      </div>
    </div>
  )
}
