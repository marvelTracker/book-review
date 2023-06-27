import express, { Express } from "express";
import dotenv from "dotenv";
import cors from "cors";

import { bookRoutes, healthCheckRoutes } from "./routes";

dotenv.config();

const app: Express = express();

const port = process.env.PORT || 8000;
app.use(
  cors({
    origin: "*",
  })
);

app.use("/api/books", bookRoutes);
app.use("/healthcheck", healthCheckRoutes);

app.listen(port, () => {
  console.log(`⚡️[server]: Server is running at https://localhost:${port}`);
});
