import React from "react";
import "./Header.css";

const navigatition=[
  {name:"Home",link:"/"},
]

const Header = () => {
  return (
    <header className="header w-full bg-white shadow-md">
      <div className="container mx-auto px-4 h-20 flex items-center justify-between">

        <div className="flex-shrink-0 flex items-center">
          <span className="text-2xl font-bold text-blue-600">LOGO</span>
        </div>

        <nav className="hidden md:flex space-x-8">
          <a href="#" className="text-gray-600 hover:text-blue-600 font-medium">Home</a>
          <a href="#" className="text-gray-600 hover:text-blue-600 font-medium">Produtos</a>
          <a href="#" className="text-gray-600 hover:text-blue-600 font-medium">Sobre</a>
        </nav>

        <div className="flex items-center space-x-4">
          <button className="p-2 text-gray-500 hover:bg-gray-100 rounded-full transition">
            <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
            </svg>
          </button>

          <div className="flex items-center space-x-2 border-l pl-4">
            <button className="px-4 py-2 text-gray-600 hover:text-blue-600 font-medium">
              Login
            </button>
            <button className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition font-medium shadow-sm">
              Cadastrar-se
            </button>
          </div>
        </div>

      </div>
    </header>
  );
}

export default Header;