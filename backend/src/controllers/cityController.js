import {getCitySuggestionsService} from "../services/cityService.js";

export const getCitySuggestions = async (req, res) => {
  try {
    const { term } = req.query; 

    // Validação de requisito funcional: mínimo 2 caracteres
    if (!term || term.length < 2) {
      return res.status(400).json({ message: "O termo de busca deve ter pelo menos 2 caracteres." });
    }
    const suggestions = await getCitySuggestionsService(term);
    res.json(suggestions);
  } catch (error) {
    console.error('Erro ao obter sugestões de cidade:', error);
    res.status(500).json({ message: 'Erro ao obter sugestões de cidade' });
  }
};
