import React, { Component } from 'react';
import { Form, Button } from 'semantic-ui-react';
import './Syntact.css';
import PlacesAutocomplete, {
    geocodeByAddress,
    getLatLng
  } from "react-places-autocomplete";

class UserDetails extends Component{

    saveAndContinue = (e) => {
        e.preventDefault()
        this.props.nextStep()
  
    }

    render(){
        const { values } = this.props;
        return(
            <Form className="form-design">
                <h1 className="ui centered">Enter Details</h1>
                <div className="row">
                    <div className="col-md-6">
                <Form.Field>
                    <label>What type of group are you representing?
                    </label>
                    <select name="grouptype" className="form-control select2"   onChange={this.props.handleChange('grouptype')}
                    defaultValue={values.grouptype}>
                   
                                      <option value="One team" >One team</option>
                                      <option value="Entire travel club" >Entire travel club</option>
                                      <option value="League" >League</option>
                                      <option value="Entire school athletic department" >Entire school athletic department</option>
                                      <option value="School band" >School band</option>
									   <option value="other">Other</option>
                                    </select>
                    {/* <input
                    placeholder='group type'
                    onChange={this.props.handleChange('grouptype')}
                    defaultValue={values.grouptype}
                    /> */}
                    
                </Form.Field>
                </div>
                <div className="col-md-6">
				 { values.grouptype === 'other'?
                <Form.Field>
                    <label>Other - What activity does your organization do?
                    </label>
                    <input
                    placeholder='other'
                    name="other_main_activity"
                    onChange={this.props.handleChange('other_main_activity')}
                    defaultValue={values.other_main_activity}
                    />
                </Form.Field>
				: ''
                }
               
                </div>
                </div>
                <div className="row">
                    <div className="col-md-6">
                <Form.Field>
                    <label>What is the name of your organization?
                    </label>
                    <input
                    type='text'
                    name="group_name"
                    placeholder='Group name'
                    onChange={this.props.handleChange('group_name')}
                    defaultValue={values.group_name}
                    />
                </Form.Field>
                <div style={{ fontSize: 12, color: "red" }}>
            {values.group_nameError}
          </div>
                </div>
                <div className="col-md-6">
                <Form.Field>
                    <label>Group’s Main Activity
                    </label>
                    <select name="main_activity" className="form-control select2"  onChange={this.props.handleChange('main_activity')}
                    defaultValue={values.main_activity}>
                                <option value="">Options</option>
                                <option value="Aquatics">Aquatics</option>
                                <option value="Band/Choir">Band/Choir</option>
                                <option value="Baseball">Baseball</option>
                                <option value="Basketball">Basketball</option>
                                <option value="Cheer/Dance">Cheer/Dance</option>
                                <option value="CC/Track">CC/Track</option>
                                <option value="Football">Football</option>
                                <option value="Hockey">Hockey</option>
                                <option value="Lacrosse">Lacrosse</option>
                                <option value="Soccer">Soccer</option>
                                <option value="Tennis">Tennis</option>
                                <option value="Volleyball">Volleyball </option>
                                <option value="Other">Other </option>                               
                                </select>

                    {/* <input
                    type='text'
                    placeholder='main activity'
                    onChange={this.props.handleChange('main_activity')}
                    defaultValue={values.main_activity}
                    /> */}
                </Form.Field>
				<div style={{ fontSize: 12, color: "red" }}>
            {values.main_activityError}
          </div>
                </div>
                </div>
                <div className="row">
                    <div className="col-md-6">
                <Form.Field>
                    <label>Mailing address for the organization

                    </label>
                    <input
                    type='text'
                    name="mailing_address"
                    placeholder='123 Main Street, Springfield, RI'
                    onChange={this.props.handleChange('mailing_address')}
                    defaultValue={values.mailing_address}
                    /> 
                </Form.Field>
                <div style={{ fontSize: 12, color: "red" }}>
            {values.mailing_address_error}
          </div>
                </div>
                    <div className="col-md-6">
                        
                <Form.Field>
                    <label>Zipcode
                    </label>
                    <input
                    type='number'
                    name="address"
                    placeholder='zipcode'
                    onChange={this.props.handleChange('address')}
                    defaultValue={values.address}
					pattern="[0-9]{5}" 
                    />
                </Form.Field>
                <div style={{ fontSize: 12, color: "red" }}>
            {values.nameError}
          </div>
		  <div style={{ fontSize: 12, color: "red" }}>
            {values.zipError}
          </div>
                </div>
                </div>

                <Form.Field>
                    <label>In this year’s group, how many youth/student participants do you estimate will be enrolled?
                    </label>
                    <input
                    type='number'
                    name="member_participants"
                    placeholder=''
                    onChange={this.props.handleChange('member_participants')}
                    defaultValue={values.member_participants}
                    min='1'  />
                </Form.Field>
                <div style={{ fontSize: 12, color: "red" }}>
            {values.participantError}
          </div>
		 
 {/*
                <Form.Field>
                    <label>In this year’s group, how many youth/student participants do you estimate will be enrolled?
                    </label>
                    <input
                    type='text'
                    placeholder='member_participants'
                    onChange={this.props.handleChange('title')}
                    defaultValue={values.title}
                    />
                </Form.Field>


                <Form.Field>
                    <label>In this year’s group, how many youth/student participants do you estimate will be enrolled?
                    </label>
                    <input
                    type='text'
                    placeholder='member_participants'
                    onChange={this.props.handleChange('body')}
                    defaultValue={values.body}
                    />
                </Form.Field>
                 */}
              <div className="button-center">
                <Button onClick={this.saveAndContinue}>Save And Continue </Button>

                </div>
            </Form>

        )
    }
}

export default UserDetails;