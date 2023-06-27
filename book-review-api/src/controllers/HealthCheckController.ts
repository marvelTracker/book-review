import { Request, Response } from "express";
import os from "os";

export class HealthCheckController {
  public getHealthCheck(req: Request, res: Response): void {
    const interfaces = os.networkInterfaces();
    let serverIp = "";
    for (const interfaceName of Object.keys(interfaces)) {
      const addresses = interfaces[interfaceName];
      if (addresses) {
        for (const address of addresses) {
          if (address.family === "IPv4" && !address.internal) {
            serverIp = address.address;
          }
        }
      }
    }
    res.json({ status: "ok", serverIp: serverIp });
  }
}
