import { getAllPropertiesService } from "../services/propertyService.js";

export const getAllProperties = async (req, res) => {
  try {
    const properties = await getAllPropertiesService();
    res.json(properties);
  } catch (error) {
    console.error('Erro ao obter propriedades:', error);
    res.status(500).json({ message: 'Erro ao obter propriedades' });
  }
}