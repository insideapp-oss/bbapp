import { useLocation } from "react-router-dom"

const titles: Record<string, string> = {
  "/": "BbApp",
  "/games": "Matchs",
  "/standings": "Classement",
}

export function AppBar() {
  const { pathname } = useLocation()
  const title = titles[pathname] ?? "BbApp"

  return (
    <header
      className="flex items-center px-4 h-14 shrink-0"
      style={{ background: "linear-gradient(to right, #da2f16, #a62818)" }}
    >
      <h1 className="text-2xl font-bold text-white">{title}</h1>
    </header>
  )
}
