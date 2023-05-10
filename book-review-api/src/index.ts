import express, { Express, Request, Response } from "express";
import dotenv from "dotenv";

import { bookRoutes } from "./routes";

dotenv.config();

const app: Express = express();
const port = process.env.PORT || 8000;

app.use("/api/books", bookRoutes);

app.listen(port, () => {
  console.log(`⚡️[server]: Server is running at https://localhost:${port}`);
});
