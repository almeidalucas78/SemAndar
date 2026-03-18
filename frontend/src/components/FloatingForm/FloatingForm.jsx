import './FloatingForm.css';
import { useState } from 'react';
import axios from 'axios';

const FloatingForm = () => {

  // O estado 'filters' armazena os valores dos inputs do formulário
  const { filters, setFilters } = useState({
    location: '',
    propertyType: '',
    maxPrice: ''
  });

  const SearchInput = ({ placeholder }) => (
    <input type="text"
      placeholder={placeholder}
      className="w-full p-2 rounded border border-none font-bold outline-none transition-all"
    />
  );


  return (
    <section className="FloatingForm mt-16 mx-[15%] rounded-lg py-5 ml-16">
      <div className="container mx-auto px-4">
        <div className="flex flex-col lg:flex-row gap-4 items-center p-4 rounded-lg">
          {/* flex-1 faz com que as divs dos inputs cresçam de forma igual */}
          <div className="flex-1 w-full">
            <SearchInput placeholder="Localização" />
          </div>
          <div className="flex-1 w-full">
            <SearchInput placeholder="Tipo de imovel" />
          </div>
          <div className="flex-1 w-full">
            <SearchInput placeholder="Valor maximo" />
          </div>
          {/* O botão não tem flex-1, então ele ocupa apenas o tamanho do seu texto + padding */}
          <div className="w-full lg:w-auto">
            <button className="w-full lg:px-8 p-2 bg-blue-500 text-white rounded">
              Pesquisar
            </button>
          </div>
        </div>
      </div>
    </section>
  );
}

export default FloatingForm;