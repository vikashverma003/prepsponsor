import React, { Component } from 'react';
import UserDetails from './UserDetails';
import PersonalDetails from './PersonalDetails';
import Confirmation from './Confirmation';
import AdditionalInfo from './AdditionalInfo';
import StepConfirmation from './StepConfirmation';
import StepTable from './StepTable';
import Success from './Success';

import axios from 'axios';
import { emptyStatement } from '@babel/types';
import AddContacts from './AddContacts';


import './new.css'

class MainForm extends Component {
    state = {
        step: 1,
        grouptype:'',
        other_main_activity:'',
        group_name:'',
        main_activity:'',
        email_org:'',
        mailing_address:'',
        contact_email:'',
        member_participants:'',
        address:'',
        facebook_page:'',
		name:[],
        first_name: '',
        last_name: '',
        email: '',
		other_first_name: '',
		other_last_name: '',
        other_email: '',
        errorMessage:'',
        posts:[],
        userId:'',
        title:'',
        body:'',
        nameError: '',
        zipError: '',
        emailError:'',
        participantError:'',
        group_nameError:'',
        other_activityError:'',
        group_activityError:'',
        main_activityError:'',
        first_nameError:'',
        last_nameError:'',
        mail_add_groupnameError:'',

    }

     validate = () => {
        let nameError = "";
        let zipError = "";
        let emailError = "";
        let participantError ="";
        let group_nameError ="";
        let other_activityError = "";
        let group_activityError = "";
        let main_activityError = "";
		
        let first_nameError = "";
        let last_nameError = "";
        let mail_add_groupnameError = "";
        let mailing_address_error = "";
        let contact_email_error = "";

        // let passwordError = "";
    
        if (!this.state.address) {
          nameError = "zipcode can not be empty";
        }
		else if(this.state.address.length<=4 || this.state.address.length>=6)
		{
			zipError = "length should be equal to five digit";
			 
		}
		
    
        /*if (!this.state.email_org.includes("@")) {
          emailError = "Please enter valid email";
        }*/
		/*if (!this.state.email_org) {
          emailError = "Please enter  address";
        }*/
		if (!this.state.mailing_address) {
          mailing_address_error = "Please enter  address";
        }
		if (!this.state.contact_email) {
          contact_email_error = "Please enter  email";
        }
        
        if (!this.state.member_participants) {
            participantError = "Number of participant can not be empty";
          }

          if (!this.state.group_name) {
            group_nameError = "Group name can not be empty";
          }
          if (!this.state.other_main_activity) {
            group_activityError = "Activity can not be empty";
          }
		  if (this.state.main_activity =='') {
            main_activityError = "Main activity can not be empty";
          }
          // second page validation
          if (!this.state.first_name) {
            first_nameError = "first name can not be empty";
          }

          if (!this.state.last_name) {
            last_nameError = "last name can not be empty";
          }

          if (!this.state.mail_add_groupname) {
            mail_add_groupnameError = "Email Address can not be empty";
          }

		

        if (emailError || mailing_address_error||contact_email_error|| nameError || zipError|| participantError || group_nameError || other_activityError||main_activityError||first_nameError||last_nameError||mail_add_groupnameError) {
          this.setState({ emailError, nameError,zipError, participantError,  group_nameError,main_activityError, other_activityError, first_nameError, last_nameError, mail_add_groupnameError,contact_email_error,mailing_address_error});
          return false;
        }
    
        return true;
      };

    nextStep = () => {

        const isValid = this.validate();
        if (isValid) {

            //console.log(23423);
         // console.log(this.state);
       }
        const { step, grouptype, address, email_org, member_participants,group_name, other_main_activity, first_name, last_name,mail_add_groupname,  mailing_address,contact_email,main_activity} = this.state
		
        if(step>1?first_name&&last_name&&contact_email:address&&mailing_address&&member_participants&&group_name&&main_activity)
        {
			if(this.state.address.length==5)
			{
        this.setState({
            step : step + 1
        }) 
			}
     
        
        // this.setState({
        //     address:this.address

        // })

        // console.log(address)
        // console.log(this.state);
        const cat = {
            grouptype:this.state.grouptype,
            group_name:this.state.group_name,
            other_main_activity:this.state.other_main_activity,
            main_activity:this.state.main_activity,
            contact_email:this.state.contact_email,
            member_participants:this.state.member_participants,
            address:this.state.address,
            facebook_page:this.state.facebook_page,
            first_name:this.state.first_name,
            last_name:this.state.last_name,
            mailing_address:this.state.mailing_address,
			name:this.state.name

        }
        //console.log("for 6th step"+cat);
        if(step===5)
        {
                axios.post('https://app.prepsponsor.com/api/addTeam',cat)
                //console.log("dfgdf", cat);
        }
        }

    }
       /* componentDidMount(){
            axios.post('https://app.prepsponsor.com/api/getSponsors/'+this.address)
            .then(response=>{
               
                this.setState({posts:response.data})
            })
            .catch(error=>{
                console.log(error);
                this.setState({errorMessage:"error retreiving data"});
            })
    }*/

    prevStep = () => {
        const { step } = this.state
        this.setState({
            step : step - 1
        })
    }

    handleChange = input => event => {
        this.setState({ [input] : event.target.value })
        const isCheckbox = event.target.type === "checkbox";
        this.setState({
          [event.target.name]: isCheckbox
            ? event.target.checked
            : event.target.value
        });
    }
	
	 addAddress =(mailing_address)=>{
    this.setState({mailing_address});
    //console.log("Here is email organisation", this.state.mailing_address);

  }
  addZipcode =(address)=>{
    this.setState({address});
   // console.log("Here is Zipcode organisation", this.state.address);

  }
    addName=(name)=>{
    //console.log("parent data");
    //console.log(name);
    name.map(names=>{
     this.setState(prevState => ({ 
      name: [...prevState.name, { firstName: names.firstName, lastName: names.lastName,email:names.email }]
      }))
    });

  }

    render(){
        const {step} = this.state;
		//console.log("render name array", this.state.name);

        const {addAddress,addZipcode,main_activityError,grouptype,mailing_address_error,contact_email_error,other_main_activity, group_name,main_activity,mailing_address,contact_email, email_org, member_participants,  firstName, lastName, email, age, city, country, userId, title, body, address, nameError,zipError, emailError,participantError, group_nameError, other_activityError, first_nameError, last_nameError, mail_add_groupnameError} = this.state;
        const values = {addAddress,addZipcode,main_activityError,grouptype,mailing_address,contact_email,mailing_address_error,contact_email_error,other_main_activity, group_name,main_activity, email_org, member_participants,firstName, lastName, email, age, city, country, userId, title, body,address, nameError,zipError, emailError, participantError, group_nameError, other_activityError, first_nameError, last_nameError, mail_add_groupnameError };
        switch(step) {
        case 1:
            return <UserDetails 
                    nextStep={this.nextStep} 
                    handleChange = {this.handleChange}
                    values={values}
					addAddress={this.addAddress}
                    addZipcode={this.addZipcode}
                    />
        case 2:
            return <AdditionalInfo 
                    nextStep={this.nextStep}
                    prevStep={this.prevStep}
                    handleChange = {this.handleChange}
                    values={values}

                    callPrep = {this.callPrep}
                    />
		case 3:
             return <AddContacts 
                              nextStep={this.nextStep}
                              prevStep={this.prevStep}
                              handleChange = {this.handleChange}
                              values={values}
							  addName={this.addName}
                              callPrep = {this.callPrep}
                              />  
        case 4:
            return <StepTable 
                                nextStep={this.nextStep}
                                prevStep={this.prevStep}
                                handleChange = {this.handleChange}
                                values={values}
                                callPrep = {this.callPrep}
                                />
        case 5:
            return <StepConfirmation 
                    nextStep={this.nextStep}
                    prevStep={this.prevStep}
                    values={values}
                    data={this.state.address}
                   
                    />
        case 6:
            return <Success   values={values}  address={this.state.address} />
        }
    }
}

export default MainForm;