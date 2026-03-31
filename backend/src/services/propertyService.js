import { findAllProperties, findPropertiesByFilters } from "../modules/propertyModel.js";

// getAllPropertiesService: chama findAllProperties e retorna propriedades.
export const getAllPropertiesService = async () => {
  const properties = await findAllProperties();
  return properties;
}

export const getPropertiesByFiltersService = async (filters) => {
  return await findPropertiesByFilters(filters);
};