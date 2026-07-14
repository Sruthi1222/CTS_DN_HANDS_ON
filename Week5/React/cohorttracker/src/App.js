import './App.css';
import { CohortsData } from './Cohort';
import CohortDetails from './CohortDetails';

function App() {

  return (
    <div>
      <h1>Cohorts Details</h1>

      <div className="cohort-container">
        {CohortsData.map((cohort) => (
          <CohortDetails
            key={cohort.cohortCode}
            cohort={cohort}
          />
        ))}
      </div>
    </div>
  );
}

export default App;