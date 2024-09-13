import React from "react";

// Define the Book interface
interface Book {
  name: string;
  author: string;
  description: string;
  genres: string;
}

const BooksPage = async () => {
  // Read the base URL from the environment variable

  const baseUrl = process.env.NEXT_API_BASE_URL;

  console.log("baseUrl", baseUrl);

  // Fetch the books from the API using the environment variable
  const res = await fetch(`${baseUrl}/api/books`, {
    cache: "no-store", // Ensures no caching
  });

  const books: Book[] = await res.json();

  return (
    <>
      <h1>Books</h1>
      <table className="table table-bordered">
        <thead>
          <tr>
            <th>Name</th>
            <th>Author</th>
            <th>Description</th>
            <th>Genres</th>
          </tr>
        </thead>
        <tbody>
          {books.map((book) => (
            <tr key={book.name}>
              <td>{book.name}</td>
              <td>{book.author}</td>
              <td>{book.description}</td>
              <td>{book.genres}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </>
  );
};

export default BooksPage;
