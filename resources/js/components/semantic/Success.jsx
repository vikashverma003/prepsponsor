import React, { Component } from 'react';
import { Form, Button, Table, Dimmer, Loader, Image,Segment,List } from 'semantic-ui-react';

import  axios from 'axios';

class Success extends Component{

    constructor(props){
        super(props)
        this.state ={
            address: this.props.address,
            posts:[],
            errorMessage:'',
            loading: true
        }
    }
    componentDidMount(){
        axios.post('https://app.prepsponsor.com/api/getSponsors/'+this.state.address)
        .then(response=>{
           //console.log(response);

            this.setState({
                posts:response.data.sponsors,
                loading: false
                
            })
        })
        .catch(error=>{
            console.log(error);
            this.setState({errorMessage:"error retreiving data"});
        })
}

    // callPrep = (e)=>{

    //     this.props.callPrep();

    //     console.log(343);

    // }
    render(){

        const {posts, errorMessage}=this.state;
		const { values } = this.props;
         //console.log("here are ", posts);
        return(
            // <div>
                // <h1 className="ui centered thanks-msg">Team has been registerd successfully. </h1>

                <div>
                    <h1>Potential sponsors</h1>
                    {

this.state.loading? <div class="ui segment">
   
<div class="ui active inverted dimmer dimmer">
<h3>ACTIVATING  {values.group_name.toUpperCase()}  CAMPAIGN</h3>
   <p>Do not close this page.  We are activating your campaign by:</p>
       <List bulleted>
        <List.Item> (1) Searching our national database for potential sponsors of {values.grouptype}</List.Item>
        <List.Item> (2) Developing invitational notifications about {values.group_name} sponsorship tiers.</List.Item>
        <List.Item> (3) Preparing your list of prospective sponsors (will display on next screen).</List.Item>
      </List>
  <p>Please be patient.  Our AI web application is screening across millions of data points to help you maximize your funding. 
    Any questions, please email funds@prepsponsor.com</p>
<br/><br/>
<br/>
  
</div>
<img
  src="https://react.semantic-ui.com/images/wireframe/short-paragraph.png"
  class="ui image"
/>
<img
  src="https://react.semantic-ui.com/images/wireframe/short-paragraph.png"
  class="ui image"
/>
<img
  src="https://react.semantic-ui.com/images/wireframe/short-paragraph.png"
  class="ui image"
/>

<img
  src="https://react.semantic-ui.com/images/wireframe/short-paragraph.png"
  class="ui image"
/>
<img
  src="https://react.semantic-ui.com/images/wireframe/short-paragraph.png"
  class="ui image"
/>
<img
  src="https://react.semantic-ui.com/images/wireframe/short-paragraph.png"
  class="ui image"
/>

<div class="content" style={{'max-height': 'calc(100vh - 210px)', 'overflow-y': 'auto'}}><div class="ui massive text loader" >
 

</div></div><div><Segment>
      <Dimmer active inverted>
        <Loader size='large'><p style={{color:'blue'}}>Loading Sponsors </p></Loader>
      </Dimmer>

      <Image src='https://react.semantic-ui.com/images/wireframe/short-paragraph.png' />
    </Segment></div>
</div>:null
}


                    <table class="ui single line table">
          
          <thead>
            <tr>
              <th>Sponsors Name</th>
              <th>City</th>
              <th>Phone</th>
			  <th>Email</th>
			  <th>Latitude</th>
			  <th>Longitude</th>


           
            </tr>
          </thead>
          <tbody>
         
                {
            
                 posts.length?posts.map(post=> <tr>
                     
                    <td>{post.business_name}</td>
                    <td>{post.city}</td>
                    <td>{post.phone}</td>
					<td>{post.email}</td>
					<td>{post.latitude}</td>
					<td>{post.longitude}</td>

                    </tr>
                 ):
                null
                }
                {
                        errorMessage?<div><h2>{ errorMessage}</h2></div>:null
                }
                 
                 </tbody>
              </table>


{/* </div> */}

                </div>


               
            
        )
    }
}

export default Success;
