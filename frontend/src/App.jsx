import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import Home from "./pages/Home/Home.jsx"
import './App.css'
import SearchResults from './pages/SearchResults/SearchResults.jsx'

function App() {


  return (
    <Router>
      <Routes>
        {/* Quando o caminho for "/", ele renderiza a Home */}
        <Route path='/' element={<Home />} />
        <Route path='/search' element={<SearchResults />} />
      </Routes>
    </Router>
  )
}

export default App
