import type { Venue } from "../../types"

interface VenueBarProps {
  venue: Venue
  dark?: boolean
}

export function VenueBar({ venue, dark = false }: VenueBarProps) {
  return (
    <div
      className={`flex items-center justify-center gap-1 px-3 py-1 text-xs ${
        dark ? "bg-black/40 text-white" : "bg-black/10 text-medium-gray"
      }`}
    >
      <svg
        width="12"
        height="12"
        viewBox="0 0 24 24"
        fill="none"
        stroke="currentColor"
        strokeWidth="2"
        strokeLinecap="round"
        strokeLinejoin="round"
        aria-hidden="true"
      >
        <path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z" />
        <circle cx="12" cy="10" r="3" />
      </svg>
      <span className="truncate">{venue.name}</span>
    </div>
  )
}
