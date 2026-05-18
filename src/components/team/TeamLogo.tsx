import type { Team } from "../../types"

export type TeamLogoSize = "small" | "medium" | "large"

const sizeMap: Record<TeamLogoSize, number> = {
  small: 32,
  medium: 48,
  large: 75,
}

interface TeamLogoProps {
  team: Team
  size?: TeamLogoSize
}

export function TeamLogo({ team, size = "medium" }: TeamLogoProps) {
  const px = sizeMap[size]
  const initials = team.name
    .split(" ")
    .slice(0, 2)
    .map((w) => w[0])
    .join("")
    .toUpperCase()

  return (
    <div
      style={{ width: px, height: px }}
      className="relative shrink-0 flex items-center justify-center"
    >
      <img
        src={`/logos/${team.id}.png`}
        alt={team.name}
        width={px}
        height={px}
        className="object-contain"
        onError={(e) => {
          e.currentTarget.style.display = "none"
          e.currentTarget.nextElementSibling?.removeAttribute("hidden")
        }}
      />
      <span
        hidden
        className="absolute inset-0 flex items-center justify-center rounded-full bg-light-gray text-text-secondary font-bold text-xs"
      >
        {initials}
      </span>
    </div>
  )
}
