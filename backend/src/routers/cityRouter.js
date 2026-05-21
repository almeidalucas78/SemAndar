import express from "express";

import { getCitySuggestions } from "../controllers/cityController.js";

const CityRouter = express.Router();

CityRouter.get("/suggestions", getCitySuggestions);

export default CityRouter;