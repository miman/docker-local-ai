import { getFuelEfficiency, getFuelEfficiencyTool, getVehicleTelematicData, getVehicleTelematicDataTool } from "./vehicle-tools.js";
import { getCurrentWeather, getCurrentWeatherTool } from "./weather-tools.js";

export const availableFunctions: Map<string, any> = new Map<string, any>();

availableFunctions.set("getCurrentWeather", getCurrentWeather);
availableFunctions.set("getFuelEfficiency", getFuelEfficiency);
availableFunctions.set("getVehicleTelematicData", getVehicleTelematicData);


export const tools: any[] = [getCurrentWeatherTool, getFuelEfficiencyTool, getVehicleTelematicDataTool];
