// App.tsx
import React, {useState, useEffect} from "react";
import logo from "./logo.svg";
import "./App.css";
import ListBook from "./book/ListBook";
import {Header} from "./header/Header";
import {CreateBook} from "./book/CreateBook";
import {BrowserRouter, Routes, Route} from "react-router-dom";

interface Book {
  name: string;
  author: string;
  description: string;
  genres: string;
}

function App() {
  const [books, setBooks] = useState<Book[]>([]);

  useEffect(() => {
    const fetchBooks = async () => {
      const response = await fetch(
        `${process.env.REACT_APP_BASE_URL_BOOK_REVIEW_API}/api/books`
      );
      const data = await response.json();
      setBooks(data);
    };

    fetchBooks();
  }, []);

  return (
    <BrowserRouter>
      <Routes>
        <Route
          path="/"
          element={
            <div className="container">
              <div className="row">
                <Header />
              </div>
              <div className="row ">
                <ListBook books={books} />
              </div>
              <div className="row ">
                <CreateBook />
              </div>
            </div>
          }
        />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
