import { getDistinctCities } from "../modules/cityModule.js";

export const getCitySuggestionsService = async (searchTerm) => {
  // Adiciona uma validação simples: busca sugestões apenas se o termo tiver 2 ou mais caracteres
  if (!searchTerm || searchTerm.length < 2) {
    return [];
  }
  return await getDistinctCities(searchTerm);
}
