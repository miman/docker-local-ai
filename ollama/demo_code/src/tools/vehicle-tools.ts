/**
 * Dummy get fuel efficiency fn
 * @param args 
 * @returns 
 */
export function getFuelEfficiency(args: { distance: number, fuelUsed: number }): string {
  console.log("Getting Fuel Efficiency for:", args);

  return `Fuel efficiency: ${args.distance / args.fuelUsed}`;
}

export const getFuelEfficiencyTool: any = {
  type: "function",
  function: {
    name: "getFuelEfficiency",
    description: "Returns the fuel efficiency based on the given distance travelled & the amount of fuel used for a vehicle",
    parameters: {
      type: "object",
      properties: {
        distance: {
          type: "number",
          description: "The distance travelled",
        },
        fuelUsed: {
          type: "number",
          description: "The amount of fuel used",
        },
      },
      required: ["distance", "fuelUsed"],
    },
  }
};

/**
 * Dummy getVehicleTelematicData fn
 * @param args 
 * @returns 
 */
export function getVehicleTelematicData(args: { distance: number, fuelUsed: number }): any {
  console.log("Getting Vehicle Telematic Data for:", args);

  const vehicledata: any = {
    position: {
      latitude: 11.12,
      longitude: 53.11,
      altitude: 22.1,
    },
    fuelLevel: 220.5,
    currentDriver: "John Doe",
  }
  return JSON.stringify(vehicledata);
}

export const getVehicleTelematicDataTool: any = {
  type: "function",
  function: {
    name: "getVehicleTelematicData",
    description: "Returns the latest known vehicle telematic data of a vehicle, such as the position of the vehicle, fuel level, current driver...",
    parameters: {
      type: "object",
      properties: {
        vehicleName: {
          type: "string",
          description: "The name of the vehicle",
        },
      },
      required: ["vehicleName"],
    },
  }
};
