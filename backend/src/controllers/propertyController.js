import { getAllPropertiesService, getPropertiesByFiltersService } from "../services/propertyService.js";

export const getAllProperties = async (req, res) => {
  try {
    const properties = await getAllPropertiesService();
    res.json(properties);
  } catch (error) {
    console.error('Erro ao obter propriedades:', error);
    res.status(500).json({ message: 'Erro ao obter propriedades' });
  }
}

export const getFilteredProperties = async (req, res) => {
  try {
    const filters = req.query; 
    const properties = await getPropertiesByFiltersService(filters);
    res.json(properties);
  } catch (error) {
    console.error('Erro ao filtrar imóveis:', error);
    res.status(500).json({ message: 'Erro ao filtrar imóveis' });
  }
};