import { useState, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import './FloatingForm.css';

//Sub-componente  para aceitar props de valor e mudança
const SearchInput = ({ name, placeholder, value, onChange }) => (
  <input
    type="text"
    name={name}
    value={value}
    onChange={onChange}
    placeholder={placeholder}
    className="w-full p-2 rounded border border-none font-bold outline-none transition-all"
  />
);

//Sub-componente para Select
const SearchSelect = ({ name, value, onChange, options }) => (
  <select
    name={name}
    value={value}
    onChange={onChange}
    className="w-full p-2 rounded border-none font-bold outline-none transition-all bg-white text-black appearance-none cursor-pointer"
  >
    <option value="">Tipo de Imóvel</option>
    {options.map((opt) => (
      <option key={opt} value={opt}>
        {opt}
      </option>
    ))}
  </select>
);

const FloatingForm = () => {
  const navigate = useNavigate();

  // Estado seguindo os nomes das colunas no banco
  const [filters, setFilters] = useState({
    city: '',
    type: '',
    maxPrice: ''
  });

  //estados para as sugestões de cidade
  const [suggestions, setSuggestions] = useState([]);
  const [showSuggestions, setShowSuggestions] = useState(false);

  const debounceTimeout = useRef(null);

  //função para atualizar o estado 'filters' quando o usuário digitar algo nos inputs
  const handleChange = (e) => {
    const { name, value } = e.target;
    setFilters(prev => ({ ...prev, [name]: value }));

    //lógica para busca de cidades
    if (name === 'city') {
      if (debounceTimeout.current) clearTimeout(debounceTimeout.current);

      if (value.length >= 2) {
        debounceTimeout.current = setTimeout(async () => {
          try {
            // O backend espera 'name' como parâmetro de busca conforme seu cityController.js
            const response = await axios.get('http://localhost:3001/cities/suggestions', {
              params: { term: value }
            });
            setSuggestions(response.data);
            setShowSuggestions(true);
          } catch (error) {
            console.error('Erro ao buscar sugestões de cidade:', error);
          }
        }, 300);
      } else {
        setSuggestions([]);
        setShowSuggestions(false);
      }
    };
  }
  // Função que redireciona para a página de resultados com os Params
  const handleSearch = async (e) => {
    e.preventDefault();
    const params = new URLSearchParams();

    // Constrói a query string apenas com o que estiver preenchido
    if (filters.city) params.append('city', filters.city);
    if (filters.type) params.append('type', filters.type);
    if (filters.maxPrice) params.append('maxPrice', filters.maxPrice);

    //redireciona para  /search?city=...&type=...
    navigate(`/search?${params.toString()}`);
  };

  // Lista de tipos baseada no  banco de dados
  const propertyTypes = ["Apartamento", "Casa", "Studio", "Kitnet"];

  return (
    <section className="FloatingForm mt-16 mx-[15%] rounded-lg py-5 ml-16">
      <div className="container mx-auto px-4">
        <form onSubmit={handleSearch} className="flex flex-col lg:flex-row gap-4 items-center p-4 rounded-lg bg-gray-100 shadow-md">

          <div className="flex-1 w-full relative" >
            <SearchInput
              name="city"
              placeholder="Localização (Ex: São Paulo)"
              value={filters.city}
              onChange={handleChange}
            />
            {
              showSuggestions && suggestions.length > 0 && (
                <ul className="absolute z-50 w-full bg-white border border-gray-300 rounded shadow-lg mt-1 max-h-60 overflow-y-auto">
                  {suggestions.map((city, index) => (
                    <li key={index} className="p-2 hover:bg-gray-100 cursor-pointer text-gray-700" onClick={() => {
                      setFilters(prev => ({ ...prev, city }));
                      setShowSuggestions(false);
                    }}>
                      {city}
                    </li>
                  ))}
                </ul>
              )}
          </div>

          <div className="flex-1 w-full">
            <SearchSelect
              name="type"
              value={filters.type}
              onChange={handleChange}
              options={propertyTypes}
            />
          </div>

          <div className="flex-1 w-full">
            <SearchInput
              name="maxPrice"
              placeholder="Preço Máximo"
              value={filters.maxPrice}
              onChange={handleChange}
            />
          </div>

          <div className="w-full lg:w-auto">
            <button
              type="submit"
              className="w-full lg:px-8 p-2 bg-blue-600 hover:bg-blue-700 text-white font-bold rounded transition-colors"
            >
              Buscar
            </button>
          </div>
        </form>
      </div>
    </section>
  );
}

export default FloatingForm;