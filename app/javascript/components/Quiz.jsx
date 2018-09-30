import React from "react"
import ReactDOM from 'react-dom'
import ReactModal from 'react-modal'
import PropTypes from "prop-types"
import axios from 'axios';

class Quiz extends React.Component {

  constructor () {
    super();
    this.state = { 
      showModal: false,
      answer : "" 
    }
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  onChange = (e) => {
    this.setState({ [e.target.name]: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    const payload = {
                answer: this.state.answer
              }
    axios.post('/user/quiz_master/answer', payload)
      .then((res) => {
        window.location.replace("/user");
    });
  }

  render () {
    const { question } = this.props

    return (
      <div className="panes">
      {(() => {
        if (question) {
          return 
            <div>
              <label>Question</label>
              <form onSubmit={this.handleSubmit}>
              <div class="form-group">
              <label>Answer</label>
              <input type="text" class="form-control" id="" name="" onChange={this.onChange} placeholder="your answer" required />
              </div>
              <button className="btn btn-primary" type="submit">Submit</button>
              </form>
            </div>
        } else {
          return 
            <div>There is no quiz</div>
        }
      })()}
      </div>
    );
  }
}

export default Quiz
