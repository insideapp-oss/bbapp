import { BrowserRouter, Route, Routes } from "react-router-dom"
import { AppBar } from "./components/nav/AppBar"
import { TabBar } from "./components/nav/TabBar"
import { HomePage } from "./pages/HomePage"
import { GamesPage } from "./pages/GamesPage"
import { StandingsPage } from "./pages/StandingsPage"

function Layout() {
  return (
    <div className="flex flex-col h-full max-w-md mx-auto bg-white shadow-lg">
      <AppBar />
      <main className="flex-1 overflow-y-auto bg-[#f5f5f5]">
        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route path="/games" element={<GamesPage />} />
          <Route path="/standings" element={<StandingsPage />} />
        </Routes>
      </main>
      <TabBar />
    </div>
  )
}

export function App() {
  return (
    <BrowserRouter>
      <Layout />
    </BrowserRouter>
  )
}
