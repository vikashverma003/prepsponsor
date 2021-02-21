import React, { Component } from 'react';
import { Form, Button } from 'semantic-ui-react';

class AddContacts extends React.Component {
    constructor(props) {
      super(props);
      this.state = {
          users: [{firstName: "", lastName: "", email:""}]
      };
      this.handleSubmit = this.handleSubmit.bind(this);
    }
    saveAndContinue = (e) => {
        e.preventDefault()
        this.props.nextStep()
    }
    back  = (e) => {
        e.preventDefault();
        this.props.prevStep();
    }
    addClick(){
      this.setState(prevState => ({ 
          users: [...prevState.users, { firstName: "", lastName: "",email:"" }]
      }))
    
  }
    
    createUI(){
       return this.state.users.map((el, i) => (
         <div key={i}>
            <input placeholder="First Name" name="firstName" value={el.firstName ||''} onChange={this.handleChange.bind(this, i)} />
            <input placeholder="Last Name" name="lastName" value={el.lastName ||''} onChange={this.handleChange.bind(this, i)} />
            <input placeholder="email" name="email" value={el.email ||''} onChange={this.handleChange.bind(this, i)} />

            <input type='button' value='remove' onClick={this.removeClick.bind(this, i)}/>
         </div>          
       ))
    }
    
    handleChange(i, e) {
       const { name, value } = e.target;
       let users = [...this.state.users];
       users[i] = {...users[i], [name]: value};
       this.setState({ users });
    }
    
    removeClick(i){
       let users = [...this.state.users];
       users.splice(i, 1);
       this.setState({ users });
    }
    
   handleSubmit(event) {
      //alert('A name was submittedd: ' + JSON.stringify(this.state.users));
      this.props.addName(this.state.users);
      this.props.nextStep()
     // console.log("Here is child compo", this.state.users);

      event.preventDefault();
    }
  
    render() {
      return (
        <form onSubmit={this.handleSubmit}>
          <h2>Additional team members</h2>
            {this.createUI()}        
            <input type='button' value='add more' onClick={this.addClick.bind(this)}/>
            {/*<input type="submit" value="Submit" /> */}
            <div className="button-center">
            <button class="ui button" onClick={this.back}>
             Back
          </button>
          <button class="ui button" type="submit" tabindex="0">
            Save And Continue 
            </button>
           {/*<div class="ui button" type="submit" tabindex="0" onClick={this.saveAndContinue}>
            Save And Continue 
          </div>*/}
          </div>
        </form>
      );
    }
  }
  export default AddContacts;