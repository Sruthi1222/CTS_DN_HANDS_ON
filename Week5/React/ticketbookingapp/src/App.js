import React, { useState } from "react";
import "./App.css";

function LoginButton(props) {
  return (
    <button onClick={props.onClick}>
      Login
    </button>
  );
}

function LogoutButton(props) {
  return (
    <button onClick={props.onClick}>
      Logout
    </button>
  );
}

function GuestGreeting() {
  return (
    <div>
      <h1>Please sign up.</h1>
      <h3>Flight Details</h3>

      <table border="1" cellPadding="8">
        <thead>
          <tr>
            <th>Flight</th>
            <th>From</th>
            <th>To</th>
            <th>Price</th>
          </tr>
        </thead>

        <tbody>
          <tr>
            <td>AI202</td>
            <td>Chennai</td>
            <td>Delhi</td>
            <td>₹4500</td>
          </tr>

          <tr>
            <td>6E305</td>
            <td>Hyderabad</td>
            <td>Mumbai</td>
            <td>₹3800</td>
          </tr>
        </tbody>
      </table>
    </div>
  );
}

function UserGreeting() {
  return (
    <div>
      <h1>Welcome back</h1>

      <h3>You can now book your tickets.</h3>

      <table border="1" cellPadding="8">
        <thead>
          <tr>
            <th>Flight</th>
            <th>From</th>
            <th>To</th>
            <th>Status</th>
          </tr>
        </thead>

        <tbody>
          <tr>
            <td>AI202</td>
            <td>Chennai</td>
            <td>Delhi</td>
            <td>Book Now</td>
          </tr>

          <tr>
            <td>6E305</td>
            <td>Hyderabad</td>
            <td>Mumbai</td>
            <td>Book Now</td>
          </tr>
        </tbody>
      </table>
    </div>
  );
}

function Greeting(props) {

  if (props.isLoggedIn) {
    return <UserGreeting />;
  }

  return <GuestGreeting />;
}

function App() {

  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const handleLogin = () => {
    setIsLoggedIn(true);
  };

  const handleLogout = () => {
    setIsLoggedIn(false);
  };

  return (
    <div style={{ margin: "40px" }}>

      <Greeting isLoggedIn={isLoggedIn} />

      <br />

      {isLoggedIn ? (
        <LogoutButton onClick={handleLogout} />
      ) : (
        <LoginButton onClick={handleLogin} />
      )}

    </div>
  );
}

export default App;