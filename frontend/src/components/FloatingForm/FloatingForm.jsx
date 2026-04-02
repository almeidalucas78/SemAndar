import { useEffect, useState } from 'react';
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

const FloatingForm = () => {
  // const testeApi = async () => {
  //   try {
  //     const response = await axios.get('http://localhost:3001/properties');
  //     console.log('Resposta da API:', response.data);
  //   } catch (error) {
  //     console.error('Erro ao chamar a API:', error);
  //   }
  // }
  // useEffect(() => {
  //   testeApi();
  // }, []);



  const navigate = useNavigate();

  // Estado seguindo os nomes das colunas no banco
  const [filters, setFilters] = useState({
    city: '',
    type: '',
    maxPrice: ''
  });

  //função para atualizar o estado 'filters' quando o usuário digitar algo nos inputs
  const handleChange = (e) => {
    const { name, value } = e.target;
    setFilters(prev => ({ ...prev, [name]: value }));
  }

  // Função que redireciona para a página de resultados com os Params
  const handleSearch = async (e) => {
    e.preventDefault();

    const params = new URLSearchParams();

    // Constrói a query string apenas com o que estiver preenchido
    if (filters.city) params.append('city', filters.city);
    if (filters.type) params.append('type', filters.type);
    if (filters.maxPrice) param.append('maxPrice', filters.maxPrice);

    //redireciona para  /search?city=...&type=...
    navigate(`/search?${params.toString()}`);
  };




  return (
    <section className="FloatingForm mt-16 mx-[15%] rounded-lg py-5 ml-16">
      <div className="container mx-auto px-4">
        <form onSubmit={handleSearch} className="flex flex-col lg:flex-row gap-4 items-center p-4 rounded-lg bg-gray-100 shadow-md">

          <div className="flex-1 w-full">
            <SearchInput
              name="city"
              placeholder="Localização (Ex: São Paulo)"
              value={filters.city}
              onChange={handleChange}
            />
          </div>

          <div className="flex-1 w-full">
            <SearchInput
              name="type"
              placeholder="Tipo (Ex: Apartamento)"
              value={filters.type}
              onChange={handleChange}
            />
          </div>

          <div className="flex-1 w-full">
            <SearchInput
              name="maxPrice"
              placeholder="Valor máximo"
              value={filters.maxPrice}
              onChange={handleChange}
            />
          </div>

          <div className="w-full lg:w-auto">
            <button
              type="submit"
              className="w-full lg:px-8 p-2 bg-blue-600 hover:bg-blue-700 text-white font-bold rounded transition-colors"
            >
              Pesquisar
            </button>
          </div>
        </form>
      </div>
    </section>
  );
}

export default FloatingForm;