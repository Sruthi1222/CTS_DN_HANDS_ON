import officeImage from "./office.jpg";
import "./App.css";

function App() {

  const office = {
    Name: "DBS",
    Rent: 50000,
    Address: "Chennai"
  };

  const officeSpaces = [
    {
      Name: "DBS",
      Rent: 50000,
      Address: "Chennai"
    },
    {
      Name: "Regus",
      Rent: 75000,
      Address: "Bangalore"
    },
    {
      Name: "WeWork",
      Rent: 55000,
      Address: "Hyderabad"
    }
  ];

  return (
    <div style={{ marginLeft: "40px" }}>

      <h1>Office Space, at Affordable Range</h1>

      <img
        src={officeImage}
        width="25%"
        height="25%"
        alt="Office Space"
      />

      <h2>Name: {office.Name}</h2>

      <h3 style={{ color: office.Rent <= 60000 ? "red" : "green" }}>
        Rent: Rs. {office.Rent}
      </h3>

      <h3>Address: {office.Address}</h3>

      <hr />

      {officeSpaces.map((item, index) => (
        <div key={index}>

          <h2>Name: {item.Name}</h2>

          <h3 style={{ color: item.Rent <= 60000 ? "red" : "green" }}>
            Rent: Rs. {item.Rent}
          </h3>

          <h3>Address: {item.Address}</h3>

          <hr />

        </div>
      ))}

    </div>
  );
}

export default App;