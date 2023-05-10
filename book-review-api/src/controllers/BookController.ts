import { Request, Response } from "express";

export class BookController {
  public async getBooks(req: Request, res: Response): Promise<any> {
    const books = [
      {
        id: "1",
        name: "Fooled by Randomness",
        author: "Nassim Nicholas Taleb",
        genres: "self-development",
        description:
          "you can do everything right and still lose, or do everything wrong and still win. It is thus not about the outcome; it is about your actions that have lead you there.",
      },
      {
        id: "2",
        name: "The 48 Laws of Power",
        author: "Robert Greene",
        genres: "self-development",
        description:
          "The fact remains that power is very real, it forms the invisible scepter of all hierarchical relations around us.",
      },
      {
        id: "3",
        name: "The 7 Habits of Highly Effective People",
        author: "Stephen. R. Covey",
        genres: "self-development",
        description:
          "He stresses the fact that we need to go through a paradigm shift – a fundamental change in how we perceive the world and ourselves.",
      },
      {
        id: "4",
        name: "The Psychedelic Explorer’s Guide",
        author: "James Fadiman",
        genres: "self-development",
        description:
          "So you can safely enhance your thinking, creativity, introspection and emotional balance.",
      },
      {
        id: "5",
        name: "Eat That Frog!",
        author: "Brian Tracy",
        genres: "self-development",
        description:
          "We get easily distracted to get rid of that feeling, only to suddenly realize that hours went by- precious hours- and then find ourselves in the same position as before, still not knowing where and how to begin, but now, feeling guilty on top of it which expresses itself in more craving for distraction.",
      },
    ];
    res.json(books);
  }
}
