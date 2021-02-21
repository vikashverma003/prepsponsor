import React, {Component} from 'react'
// import {Jumbotron as jumbo, Container, Col, Image, Table, Button} from 'react-bootstrap'
import { Form, Button, Table, Dimmer, Loader, Image,Segment } from 'semantic-ui-react';
import  axios from 'axios';

// export const StepTable = ()=>(
    class StepTable extends Component{


      constructor(props){

        super(props)
        this.state ={
            posts:[],
            errorMessage:'',
            loading: true
        }
    }


        saveAndContinue = (e) => {
            e.preventDefault()
            this.props.nextStep()
        }
    
    
        back  = (e) => {
            e.preventDefault();
            this.props.prevStep();
        }
        
    componentDidMount(){
      axios.get('https://app.prepsponsor.com/api/selectPackage/')
      .then(response=>{
          // console.log("new data", response);

          this.setState({
            posts:response.data.success,
            loading: false
          })
      })
      .catch(error=>{
          console.log(error);
          this.setState({errorMessage:"error retreiving data"});
      })
}



      //   onData  = (e) => {
      //     e.preventDefault();
      //     this.props.callPrep();
      //     console.log(this.props.zipcode);
      // }
    
        render(){

          const {posts, errorMessage}=this.state
          //console.log("new datas", posts);

          const {values: { grouptype,  other_main_activity,group_name,main_activity, email_org,member_participants, facebook_page,   firstName, lastName, email, age, city, country, zipcode }} = this.props;

            // const { values } = this.props;
            return(

                <div>

                <h1> Set Your Sponsorship Tiers.
         </h1>
                  <p>Set your sponsorship levels & value below! Successfully sponsored organization have four tiers like below to maximize contributions. Please
                    customize your own group’s sponsorship options and fill in the description of what you are providing each sponsor (see example descriptions at
                    bottom for ideas!).
                  </p>
                  {

                    this.state.loading? <div class="ui segment">
                    <p></p>
                    <div class="ui active dimmer">
                      <div class="ui huge text loader">Loading.....</div>
                    </div>
                    <Image src='https://react.semantic-ui.com/images/wireframe/short-paragraph.png' />

                  </div>:null
                  }
                 
                  <table class="ui single line table">
          
            <thead>
              <tr>
               
                <th>Tier Name (Levels)</th>
                <th>Active</th>
                <th>Description </th>
              <th>  Sponsor $ Amount</th>
              <th>Slots Available</th>
              <th>Total</th>
              </tr>
            </thead>


            <tbody>
              
              
           
              {/* <tr>
                <td>1</td>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
                <td>Mark</td>
                <td>Otto</td>
                <td>5555</td>
               
              </tr> */}
           
      
      {
         
            
            posts.length?posts.map(post=> <tr>
               
               <td>{post.tier_name}</td>
               <td>{post.active}</td>
               <td>{post.description}</td>
               <td>{post.sponsor_amount}</td>
               <td>{post.slot_available}</td>
               <td>{post.Total}</td>
               </tr>
            ):
           null
           }
           {
                   errorMessage?<div><h2>{ errorMessage}</h2></div>:null
           }







{/* 
              <tr>
                <td>2</td>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
                <td>Mark</td>
                <td>Otto</td>
                <td>34334</td>
              
              </tr>
              <tr>
                <td>3</td>
                <td>@twitter</td>
                <td>@twitter</td>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
                <td>3434</td>
              </tr>
          
              <tr>
                <td>4</td>
                <td>@Mark</td>
                <td>@Marky</td>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
                <td>787878</td>
              </tr> */}
             
            </tbody>
          </table>
          <p>Here are some examples of sponsorship tiers
          </p>
          <br />
          <p>As the exclusive Diamond sponsor, your business will get its logo on team jerseys as well as a full page ad in our spring tournament booklet which
          is viewed by 5000 participants. Also, we will send out an email about your company (including a coupon or other time-sensitive offer) to our entire
          membership database 2x per year (your choice). Your logo will be placed prominently on our website so that every family in our township will
          know of your generosity in supporting our local travel club.
          </p>
          <div className="button-center">
          <button class="ui button" onClick={this.back}>
            Back
          </button>
          <div class="ui button" tabindex="0" onClick={this.saveAndContinue}>
            Save And Continue 
          </div>
          </div>
          
          <br />
              </div>

            )
          }
        }    
export default StepTable