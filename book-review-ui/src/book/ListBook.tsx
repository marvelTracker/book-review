// book/ListBook.tsx
import React from "react";

interface Book {
  name: string;
  author: string;
  description: string;
  genres: string;
}

interface ListBookProps {
  books: Book[];
}

const ListBook: React.FC<ListBookProps> = ({books}) => {
  return (
    <div>
      <h1>List Books</h1>
      <table className="table">
        <thead>
          <tr>
            <th scope="col">Name</th>
            <th scope="col">Author</th>
            <th scope="col">Description</th>
            <th scope="col">Genres</th>
          </tr>
        </thead>
        <tbody>
          {books.map((item, index) => (
            <tr key={index}>
              <th scope="row">{item.name}</th>
              <td>{item.author}</td>
              <td>{item.description}</td>
              <td>{item.genres}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default ListBook;
