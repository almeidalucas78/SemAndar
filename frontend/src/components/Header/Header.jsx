import React from "react";
import "./Header.css";

const Header = () => {
  return (
    <header className="header w-full bg-white shadow-md">
      <div className="flex-shrink-0 flex items-center">
        <span className="text-2xl font-bold text-blue-600">Logo</span>
      </div>
    </header>
  );
}

export default Header;