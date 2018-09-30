import React from "react"
import ReactDOM from 'react-dom'
import ReactModal from 'react-modal'
import PropTypes from "prop-types"
import axios from 'axios';

class StartQuiz extends React.Component {

  render () {
    return (
      <div>
      {(() => {
        return 
          <div>
            <form onSubmit={this.handleSubmit}>
              <button className="btn btn-primary" type="submit">Start Quiz</button>
            </form>
          </div>
      })()}
      </div>
    );
  }
}

export default StartQuiz
