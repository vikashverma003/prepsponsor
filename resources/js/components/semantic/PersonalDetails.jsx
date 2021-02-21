import React, { Component } from 'react';
import { Form, Button } from 'semantic-ui-react';
import { throws } from 'assert';

class PersonalDetails extends Component{
    saveAndContinue = (e) => {
        e.preventDefault();
        this.props.nextStep();
    }

    back  = (e) => {
        e.preventDefault();
        this.props.prevStep();
    }

    render(){
        const { values } = this.props
        return(
        <Form color='blue' >
            <h1 className="ui centered">Additional Team Details</h1>
            <Form.Field>
                <label>Group’s Main Activity
                </label>
                <input placeholder='main_activity'
                onChange={this.props.handleChange('main_activity')}
                defaultValue={values.main_activity}
                />
            </Form.Field>
            <Form.Field>
                <label>Mailing address for the organization
                </label>
                <input placeholder='email_org'
                onChange={this.props.handleChange('email_org')}
                defaultValue={values.city}
                />
            </Form.Field>
            <Form.Field>
                <label>In this year’s group, how many youth/student participants do you estimate will be enrolled?
               </label>
                <input placeholder='member_participants'
                onChange={this.props.handleChange('member_participants')}
                defaultValue={values.member_participants}
                />
            </Form.Field>
            <Button onClick={this.back}>Back</Button>
            <Button onClick={this.saveAndContinue}>Save And Continue </Button>
        </Form>
        )
    }
}

export default PersonalDetails;