import express from "express";
import { HealthCheckController } from "../controllers";

const router = express.Router();
const healthCheckController = new HealthCheckController();

router.get("/", healthCheckController.getHealthCheck);

export { router as healthCheckRoutes };
