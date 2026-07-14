import React, { useState } from "react";

function CurrencyConvertor() {

  const [rupees, setRupees] = useState("");
  const [euro, setEuro] = useState("");

  const handleSubmit = (event) => {
    event.preventDefault();

    const converted = (parseFloat(rupees) / 90).toFixed(2);
    setEuro(converted);

    alert("Converting to Euro Amount is " + converted);
  };

  return (
    <div>
      <h1 style={{ color: "green" }}>Currency Convertor!!!</h1>

      <form onSubmit={handleSubmit}>
        <table>
          <tbody>
            <tr>
              <td>Amount</td>
              <td>
                <input
                  type="number"
                  value={rupees}
                  onChange={(e) => setRupees(e.target.value)}
                />
              </td>
            </tr>

            <tr>
              <td>Currency</td>
              <td>
                <input
                  type="text"
                  value={euro}
                  readOnly
                />
              </td>
            </tr>

            <tr>
              <td></td>
              <td>
                <button type="submit">Submit</button>
              </td>
            </tr>
          </tbody>
        </table>
      </form>
    </div>
  );
}

export default CurrencyConvertor;