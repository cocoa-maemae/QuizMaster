import React from "react"
import PropTypes from "prop-types"

class QuizManagement extends React.Component {

  addTodo() {
    const { quiz_list } = this.state
    //quiz_list.push('追加したよ')
    //this.setState({ quiz_list })
  }

  render () {
    const { quiz_list } = this.props
    return (
      <React.Fragment>
      <button type="button" className="btn btn-primary" onClick={() => this.addQuiz()}>Add Quiz</button>
      <table className="table table-striped">
        <thead>
          <tr>
            <th className="col-md-1">#</th>
            <th className="col-md-4">Quiz</th>
            <th className="col-md-3">Answer</th>
            <th className="col-md-2">Operation</th>
          </tr>
        </thead>
        <tbody>
          {quiz_list.map(quiz => 
            <tr key={quiz}>
              <th>{quiz.rowid}</th>
              <th>{quiz.quiz}</th>
              <th>{quiz.answer}</th>
              <th><button type="button" className="btn btn-primary" onClick={() => this.addQuiz()}>Delete</button></th>
            </tr>
          )}
        </tbody>
      </table>
      </React.Fragment>
    );
  }
}

QuizManagement.propTypes = {
  greeting: PropTypes.string
};
export default QuizManagement
