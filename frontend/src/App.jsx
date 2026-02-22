import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import Home from '../pages/Home/Home'
import './App.css'

function App() {


  return (
    <Router>
      <Routes>
        {/* Quando o caminho for "/", ele renderiza a Home */}
        <Route path='/' element={<Home />} />
      </Routes>
    </Router>
  )
}

export default App
