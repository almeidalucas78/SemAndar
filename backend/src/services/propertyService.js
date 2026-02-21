import { findAllProperties } from "../modules/propertyModel.js";

// getAllPropertiesService: chama findAllProperties e retorna propriedades.
export const getAllPropertiesService = async () => {
  const properties = await findAllProperties();
  return properties;
}