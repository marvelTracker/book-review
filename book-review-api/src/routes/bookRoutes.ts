import { Router } from "express";
import { BookController } from "../controllers";

const router = Router();
const bookController = new BookController();

router.get("/", bookController.getBooks);

export { router as bookRoutes };
