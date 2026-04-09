import { useEffect, useState } from 'react';
import { useSearchParams } from 'react-router-dom';
import axios from 'axios';

const SearchResults = () => {

  // 1. Lê a URL do navegador. Se estiver em /search?city=São Paulo, ele "pega" o city=São Paulo.
  const [searchParams] = useSearchParams();
  // 2. Cria a lista onde os imóveis vindos do banco de dados serão guardados. Começa vazia [].
  const [properties, setProperties] = useState([]);
  // 3. Um "aviso" visual. Começa como 'true' porque assim que a página abre, ela começa a buscar dados.
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchProperties = async () => {
      setLoading(true);
      try {
        //pega os valores da url
        const city = searchParams.get('city');
        const type = searchParams.get('type');
        const maxPrice = searchParams.get('maxPrice');

        // A PONTE: O Axios faz a chamada para o seu Backend Node.js.
        // O objeto 'params' envia os filtros de forma limpa: ?city=...&type=...
        const response = await axios.get('http://localhost:3001/properties/search', {
          params: { city, type, maxPrice }
        });
        // Guardamos os imóveis que o Node encontrou no estado 'properties'.
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