import React from "react";
import { MemoryRouterProps } from "react-router-dom";

interface AppProps {}

interface AppState {
  books: any;
}

export class ListBook extends React.Component<AppProps, AppState> {
  constructor(props: any) {
    super(props);
    this.state = {
      books: [],
    };
  }

  fetchBooks = () => {
    fetch(process.env.BASE_URL_BOOK_REVIEW_API + "/api/book")
      .then((res) => res.json())
      .then((data) => {
        this.setState({ books: data });
      });
  };

  componentDidMount() {
    this.fetchBooks();
  }

  render() {
    const { books } = this.state;
    debugger;
    return (
      <div>
        <h1>List Books</h1>
        {
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
              {books.map((item: any) => (
                <tr>
                  <th scope="row">{item.name}</th>
                  <td>{item.author}</td>
                  <td>{item.description}</td>
                  <td>{item.genres}</td>
                </tr>
              ))}
            </tbody>
          </table>
        }
      </div>
    );
  }
}
