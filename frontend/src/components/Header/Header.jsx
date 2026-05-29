import React from "react";
import { House } from "lucide-react";
import "./Header.css";

const navigatition = [
  { name: "Home", link: "/" },
]

const Header = () => {
  return (
    <header className="header w-full bg-white shadow-md">
      <div className="container mx-auto px-4 h-20 flex items-center justify-between">

        <div className="flex-shrink-0 flex items-center header-logo">
          <span className="text-1xl font-semibold text-black-500 flex items-center gap-2">
            <House size={28} strokeWidth={2.5} />
            SemAndar
          </span>
        </div>

        <nav className="hidden md:flex space-x-8">
          <a href="#" className="text-gray-600font-medium">Home</a>
          <a href="#" className="text-gray-600 font-medium">Produtos</a>
          <a href="#" className="text-gray-600 font-medium">Sobre</a>
        </nav>

        <div className="flex items-center space-x-4">

          <div className="flex items-center space-x-2">
            <button className="button-clean px-4 py-2 text-gray-600 font-medium">
              Entrar
            </button>
            <button className="button-default px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition font-medium shadow-sm">
              Cadastrar-se
            </button>
          </div>
        </div>

      </div>
    </header>
  );
}

export default Header;