import { useEffect, useState } from 'react';
import { useSearchParams } from 'react-router-dom';
import axios from 'axios';

const SearchResults = () => {
  const [searchParams] = useSearchParams();
  const [properties, setProperties] = useState([]);
  const [loading, setLoading] = useState(true);
  
  useEffect(() => {
    const fetchProperties = async () => {
      setLoading(true);
      try {
        //pega os valores da url
        const city = useSearchParams.get('city');
        const type = useSearchParams.get('type');
        const maxPrice = useSearchParams.get('maxPrice');

        //chama a rota de busca com os parametors
        const response = await axios.get('http://localhost:3001/properties/search', {
          params: { city, type, maxPrice }
        });
        setProperties(response.data);
      } catch (error) {
        console.log("Erro ao buscar imóveis:", error);
      } finally {
        setLoading(false);
      }
    };

    fetchProperties();
  }, [searchParams]);// Recarrega sempre que a URL mudar


  return (
    <div className='container mx-auto p-8'>
      <h1>Resultados da busca</h1>
      {loading ? (
        <p>Carregando...</p>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          {properties.length > 0 ? (
            properties.map((property) => (
              <div key={property.id} className="border p-4 rouded shadow">
                <h2 className="font-bold">{property.title}</h2>
                <p>{property.city}-{property.type}</p>
                <p className="text-blue-600 font-bold">R$: {property.price}</p>
              </div>
            ))
          ) : (
            <p>Nenhum imóvel encontrado</p>
          )}
        </div>
      )}
      </div>
      );
  };
  
  export default SearchResults;