import React, { Component } from 'react';
import { Form, Button } from 'semantic-ui-react';

class AdditionalInfo extends Component{

    saveAndContinue = (e) => {
        e.preventDefault();
        this.props.nextStep();
    }

    back  = (e) => {
        e.preventDefault();
        this.props.prevStep();
    }

    callPrep = (e)=>{
        e.preventDefault();
        this.props.callPrep();
    }

    render(){
        const { values } = this.props;

        // console.log({values.grouptype});
        return(
            <Form className="form-design">
                <h1 className="ui centered">Contact Information for {values.group_name}</h1>
                <div className="row">
                    <div className="col-md-6">
                <Form.Field>
                    <label>First Name</label>
                    <input
                    placeholder='First Name'
					name="first_name"
                    onChange={this.props.handleChange('first_name')}
                    defaultValue={values.first_name}
                    />
                </Form.Field>
				 <div style={{ fontSize: 12, color: "red" }}>
            {values.first_nameError}
          </div>
                </div>
                <div className="col-md-6">
                <Form.Field>
                    <label>Last Name</label>
                    <input
                    placeholder='Last Name'
					name="last_name"
                    onChange={this.props.handleChange('last_name')}
                    defaultValue={values.last_name}
                    />
                </Form.Field>
				<div style={{ fontSize: 12, color: "red" }}>
            {values.last_nameError}
          </div>
                </div>
                </div>
                <div className="row">
                    <div className="col-md-6">
                <Form.Field>
                    <label>Email Address</label>
                    <input
                    type='email'
					name="contact_email"
                    placeholder='Email Address'
                    onChange={this.props.handleChange('contact_email')}
                    defaultValue={values.contact_email}
                    />
                </Form.Field>
				<div style={{ fontSize: 12, color: "red" }}>
            {values.contact_email_error}
          </div>
                </div>
                <div className="col-md-6">
                 <Form.Field>
                    <label>Facebook Page(Optional)</label>
                    <input
                   
                    placeholder='https://www.facebook.com/soccer_club'
                    onChange={this.props.handleChange('facebook_page')}
                    defaultValue={values.facebook_page}
                    />
                </Form.Field>
                </div>
                </div>
{/*                 
                <Form.Field>
                    <label>In this year’s group, how many youth/student participants do you estimate will be enrolled?
                    </label>
                    <input
                    type='text'
                    placeholder='title'
                    onChange={this.props.handleChange('title')}
                    defaultValue={values.title}
                    />
                </Form.Field>

                <Form.Field>
                    <label>In this year’s group, how many youth/student participants do you estimate will be enrolled?
                    </label>
                    <input
                    type='text'
                    placeholder='body'
                    onChange={this.props.handleChange('body')}
                    defaultValue={values.body}
                    />
                </Form.Field>

                <Form.Field>
                    <label>In this year’s group, how many youth/student participants do you estimate will be enrolled?
                    </label>
                    <input
                    type='text'
                    placeholder='userId'
                    onChange={this.props.handleChange('userId')}
                    defaultValue={values.userId}
                    />
                </Form.Field> */}
                <div className="button-center">
                <Button onClick={this.back}>Back</Button>
                <Button onClick={this.saveAndContinue}>Save And Continue </Button>
                </div>
            </Form>
        )
    }
}

export default AdditionalInfo;