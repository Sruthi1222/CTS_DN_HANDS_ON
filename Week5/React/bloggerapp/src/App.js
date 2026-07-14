import "./App.css";

import BookDetails from "./BookDetails";
import BlogDetails from "./BlogDetails";
import CourseDetails from "./CourseDetails";

import { books, blogs, courses } from "./Data";

function App() {
  return (
    <div className="container">

      <div className="box">
        <CourseDetails courses={courses} />
      </div>

      <div className="box">
        <BookDetails books={books} />
      </div>

      <div className="box">
        <BlogDetails blogs={blogs} />
      </div>

    </div>
  );
}

export default App;