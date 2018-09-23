import React from "react"
import ReactDOM from 'react-dom'
import ReactModal from 'react-modal'
import PropTypes from "prop-types"
import axios from 'axios';

const customStyles = {
  content : {
    top          : '22%',
    left         : '50%',
    right        : '20%',
    bottom       : '50%',
    marginRight  : '-23%',
    transform    : 'translate(-50%, -50%)'
  }
};

ReactModal.setAppElement('#addQuiz')

class AddQuizModal extends React.Component {

  constructor () {
    super();
    this.state = { 
      showModal: false,
      question : "", 
      answer : "" 
    }
    this.handleOpenModal = this.handleOpenModal.bind(this);
    this.handleCloseModal = this.handleCloseModal.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleOpenModal () {
    this.setState({ showModal: true });
  }

  handleCloseModal () {
    this.setState({ showModal: false });
  }

  onChange = (e) => {
    this.setState({ [e.target.name]: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    const payload = {
                question: this.state.question,
                answer: this.state.answer
              }
    axios.post('/admin/quiz_management/add', payload)
      .then((res) => {
        window.location.replace("/admin");
    });
  }

  render () {
    return (
      <React.Fragment>
      <button type="button" className="btn btn-primary" onClick={this.handleOpenModal}>Add Quiz</button>
      <ReactModal
        isOpen={this.state.showModal}
        onRequestClose={this.handleCloseModal}
        overlayClassName="Overlay"
        style={customStyles}
      >
      <form onSubmit={this.handleSubmit}>
        <div class="form-group">
          <label>Question</label>
          <input type="text" class="form-control" id="question" name="question" onChange={this.onChange} placeholder="What's the mininum prime number?" required />
          <label>Answer</label>
          <input type="text" class="form-control" id="answer" name="answer" onChange={this.onChange} placeholder="3" required />
        </div>
        <button className="btn btn-primary" type="submit">Add</button>
        &nbsp;
        <button className="btn btn-primary" onClick={this.handleCloseModal}>Close</button>
      </form>
      </ReactModal>
      </React.Fragment>
    );
  }
}

export default AddQuizModal
