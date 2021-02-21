import React, { Component } from 'react';
import { Button, List } from 'semantic-ui-react';

class Confirmation extends Component{
    saveAndContinue = (e) => {
        e.preventDefault();
        this.props.nextStep();

    }

    back  = (e) => {
        e.preventDefault();
        this.props.prevStep();
    }

    render(){

        const {values: { grouptype,  other_main_activity,group_name,main_activity, email_org,member_participants, facebook_page,   firstName, lastName, email, age, city, country }} = this.props;

        return(
            <div>
                <h1 className="ui centered">Confirm your Details</h1>
                <p>Click Confirm if the following details have been correctly entered</p>
                <List>
                <List.Item>
                        <List.Icon name='universal access' />
                        <List.Content>Group Type: {grouptype}</List.Content>
                    </List.Item>
                    <List.Item>
                        <List.Icon name='users' />
                        <List.Content>Other Main Activity: {other_main_activity}</List.Content>
                    </List.Item>
                    <List.Item>
                        <List.Icon name='users' />
                        <List.Content>Group Name: {group_name}</List.Content>
                    </List.Item>
                    <List.Item>
                        <List.Icon name='users' />
                        <List.Content>Main Activity: {main_activity}</List.Content>
                    </List.Item>

                    <List.Item>
                        <List.Icon name='users' />
                        <List.Content>Email of org: {email_org}</List.Content>
                    </List.Item>

                    <List.Item>
                        <List.Icon name='users' />
                        <List.Content>Team Size: {member_participants}</List.Content>
                    </List.Item>
                    <List.Item>
                        <List.Icon name='envelope' />
                        <List.Content>Email of org: {email_org}</List.Content>
                    </List.Item>
                    <List.Item>
                        <List.Icon name='facebook official' />
                        <List.Content>Facebook Page: {facebook_page}</List.Content>
                    </List.Item>



                    <List.Item>
                        <List.Icon name='users' />
                        <List.Content>First Name: {firstName}</List.Content>
                    </List.Item>
                    <List.Item>
                        <List.Icon name='users' />
                        <List.Content>Last Name: {lastName}</List.Content>
                    </List.Item>
                    <List.Item>
                        <List.Icon name='mail' />
                        <List.Content>
                            <a href='mailto:jack@semantic-ui.com'>{email}</a>
                        </List.Content>
                    </List.Item>
                    {/* <List.Item>
                        <List.Icon name='calendar' />
                        <List.Content>{age} Years</List.Content>
                    </List.Item>
                    <List.Item>
                        <List.Icon name='marker' />
                        <List.Content>{city}, {country}</List.Content>
                    </List.Item>  */}
                </List>

                <Button onClick={this.back}>Back</Button>
                <Button onClick={this.saveAndContinue}>Confirm</Button>
            </div>
        )
    }
}

export default Confirmation;