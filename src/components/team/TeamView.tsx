import type { Team } from "../../types"
import { TeamLogo, type TeamLogoSize } from "./TeamLogo"

interface TeamViewProps {
  team: Team
  size?: TeamLogoSize
  bold?: boolean
}

export function TeamView({ team, size = "medium", bold = false }: TeamViewProps) {
  return (
    <div className="flex flex-col items-center gap-2 min-w-0">
      <TeamLogo team={team} size={size} />
      <span
        className={`text-xs text-center truncate w-full ${bold ? "font-bold" : "font-normal"}`}
      >
        {team.name}
      </span>
    </div>
  )
}
