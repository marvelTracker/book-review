import React from "react";
import logo from "./logo.svg";
import "./App.css";
import { ListBook } from "./book/ListBook";
import { Header } from "./header/Header";
import { CreateBook } from "./book/CreateBook";
import { BrowserRouter, Routes, Route } from "react-router-dom";

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route
          path="/"
          element={
            <div className="container">
              <div className="row">
                <Header></Header>
              </div>
              <div className="row ">
                <ListBook></ListBook>
              </div>
              <div className="row ">
                <CreateBook></CreateBook>
              </div>
            </div>
          }
        ></Route>
      </Routes>
    </BrowserRouter>
  );
}

export default App;
