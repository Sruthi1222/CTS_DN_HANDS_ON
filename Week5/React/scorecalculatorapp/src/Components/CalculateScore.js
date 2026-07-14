import "../Stylesheets/mystyle.css";

const percentToDecimal = (decimal) => {
    return (decimal.toFixed(2) + "%");
};

const calcScore = (total, goal) => {
    return percentToDecimal(total / goal);
};

export function CalculateScore(props) {
    return (
        <div className="formatstyle">
            <h1><b>Student Details:</b></h1>

            <div className="Name">
                <b>Name: </b>
                <span>{props.Name}</span>
            </div>

            <div className="School">
                <b>School: </b>
                <span>{props.School}</span>
            </div>

            <div className="Total">
                <b>Total: </b>
                <span>{props.total} Marks</span>
            </div>

            <div className="Score">
                <b>Score: </b>
                <span>{calcScore(props.total, props.goal)}</span>
            </div>
        </div>
    );
}