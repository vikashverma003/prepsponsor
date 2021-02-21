import React from 'react'
import {Jumbotron as jumbo, Container, Col, Image,  ButtonToolbar, Modal, Checkbox} from 'react-bootstrap'
import { Form, Button, Table} from 'semantic-ui-react';
import  axios from 'axios';
import {BrowserRouter as Router, Route, Switch, Link} from 'react-router-dom';
//import Edit from './edit.component';

class StepConfirmation extends React.Component{

  constructor(props, context) {
    super();

  //   this.state ={
  //     posts:[],
  //     errorMessage:''
  // }

    this.handleShow = this.handleShow.bind(this);
    this.handleHide = this.handleHide.bind(this);

    this.handleShow1 = this.handleShow1.bind(this);
    this.handleHide1 = this.handleHide1.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);

    this.state = {
      show: false,
      posts:[],
      ss_amount:'',
      ss_total:'',
      ss_slot:'',
      ss_count:'',
      errorMessage:'',
      loading: true,
      edit: false,
      show1:false,
      tier_name:'',
      active:'',
      description:'',
	  slot_available:'',
      id:'',
      product:[]
    };
  }

  handleShow() {
    this.setState({ show: true });
  }
  handleShow1=(e,id)=>{
    console.log("tttt",e.target.value)
     axios.post('https://app.prepsponsor.com/api/edit-package/'+e.target.value)
    .then(response => {
      console.log("edit package daatattt", response.data.success);
      //console.log("dataaa", response);
      this.setState({ 
          edit:true,
          id: response.data.success.id, 
          tier_name: response.data.success.tier_name, 
          active: response.data.success.active,
          description: response.data.success.description,
          sponsor_amount: response.data.success.sponsor_amount,
          slot_available: response.data.success.slot_available
        });
    })
    .catch(function (error) {
        console.log(error);
    }) 
//console.log("Products ",this.state.product);
    this.setState({ show1: true
   });
  

  }

  handleHide(){
    this.setState({ show: false });
  }
  handleHide1(){
    this.setState({ show1: false });
  }
    saveAndContinue = (e) => {
        e.preventDefault()
        this.props.nextStep()
    }


    back  = (e) => {
        e.preventDefault();
        this.props.prevStep();
    }

    handleChange(event) {
      const name = event.target.name;
      const value = event.target.value;
  
      this.setState({
        [name]: value
      })
    }

    handleSubmit(event) {
      event.preventDefault();
      console.log("updated statet ",this.state);
      //this.setState(this.initialState);
      const ids=this.state.id;
      console.log("iddddd ", ids);
      const changedData={
        tier_name:this.state.tier_name,
        active:this.state.active,
        description:this.state.description,
        slot_available:this.state.slot_available
      }

      console.log("edited data ", changedData);
     axios.post('https://app.prepsponsor.com/api/update-package/'+ids,changedData)
     this.handleHide1();
     /*.then(response=>{              
      this.setState({id:false})
      })
      .catch(error=>{
          console.log(error);
          this.setState({errorMessage:"error in sending the data"});
      })*/

    }

    componentDidMount(){
      axios.get('https://app.prepsponsor.com/api/selectPackage/')
      .then(response=>{
          // console.log("new datauuu", response);
          this.setState({
            posts:response.data.success,
            ss_amount:response.data.sp_amount,
            ss_total:response.data.total_spo_amount,
            ss_slot:response.data.slot_availables,
            ss_count:response.data.ss_count,
            loading: false
          
          })
      })
      .catch(error=>{
          console.log(error);
          this.setState({errorMessage:"error retreiving data"});
      })
}

editData=(e)=>{
  axios.get('http://localhost/presponsor/public/api/edit-package/'+ this.state.id)
  .then(response => {
    console.log("edit daatattt", response.data);
      
    /*this.setState({ 
        tier_name: response.data.package.tier_name, 
        active: response.data.package.active,
        description: response.data.package.description,
        sponsor_amount: response.data.package.sponsor_amount
      });*/
  })
  .catch(function (error) {
      console.log(error);
  })
}


  render() {
    const { values } = this.props;

    // console.log("Here is props", values.address);


    const {posts, errorMessage}=this.state

    console.log("package data info", posts);

    console.log("slots available",this.state.ss_slot);

    return (
        <div>

      <h1> Confirmation </h1>
        <p>Below is Your Desired Sponsorship

        </p>
        {

this.state.loading? <div class="ui segment">
   
<div class="ui active transition visible dimmer">
<h3> Activating  {values.group_name}  Campaign</h3>
   Do not close this page.  We are activating your campaign by:
        <p> 1 Searching our <h4>national database</h4> for potential sponsors of {values.grouptype}</p>
  <p>2 Developing <h4>invitational notifications</h4> about {values.group_name} sponsorship tiers.</p> 
  <p> 3 Preparing your <h4>list of prospective sponsors</h4> (will display on next screen).</p>
  <p>Please be patient.  Our AI web application is screening across millions of data points to help you maximize your funding. 
    Any questions, please email funds@sponsorprep.com</p>
<br/><br/>
<br/>
  <div class="content" style={{'max-height': 'calc(100vh - 210px)', 'overflow-y': 'auto'}}><div class="ui massive text loader" >Loading Sponsors 

</div></div>
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
</div>:null
}


        <table class="ui single line table">
            <thead>
    <tr>
     
      <th>Tier Name (Levels)</th>
      <th>Active</th>
      <th>Description of Sponsorship Level</th>
    <th>Sponsor $ Amount</th>
    <th>Slots Available</th>
    <th>Total</th>
    <th>Edit</th>

    </tr>
  </thead>
  <tbody>

  {
    
            posts.length?posts.map(post=> <tr>

               <td>{post.tier_name}</td>
               <td>{post.active}</td>
               <td>{post.description}</td>
               <td>{post.sponsor_amount}</td>
               <td>{post.slot_available}</td>
               <td>{post.Total}</td>
               <td><input type="checkbox" value={post.id} onClick={this.handleShow1} /> </td> </tr>
            ):
           null
           }
           {
                   errorMessage?<div><h2>{ errorMessage}</h2></div>:null
           }
         <tr>
               <td><h3>Maximum Sponsorship Revenue</h3></td>
               <td></td>
               <td></td>
               <td>{this.state.ss_amount}</td>
               <td>{this.state.ss_slot}</td>
               <td>{this.state.ss_total}</td>
         </tr>  




    {/* <tr>
     
      <td>Gold</td>
      <td>Otto</td>
      <td>@mdo</td>
      <td>Mark</td>
      <td>Otto</td>
      <td>5555</td>
     
    </tr> */}
   
   
  </tbody>
</table>
<p>At the end of your sponsorship campaign you will receive the net proceeds {this.state.ss_total*.15}</p>
<br />
<p>Before clicking the CONFIRM button, please read the Sponsorship Agreement.
</p>
{/* 
<Modal
   trigger={<Button>Show Modal</Button>}
    header='Reminder!'
    content='Call Benjamin regarding the reports.dfggggggggggggggggg'
    actions={['Snooze', { key: 'done', content: 'Done', positive: true }]}
  />
<br /><br/> */}

{this.state.edit?<ButtonToolbar>
<Modal
          {...this.props}
          show={this.state.show1}
          onHide={this.handleHide1}
          dialogClassName="custom-modal"
        >
          <Modal.Header closeButton>
            <Modal.Title id="contained-modal-title-lg">
           <h2> Edit Package</h2>

            </Modal.Title>
          </Modal.Header>
          <Modal.Body >
          <Form onSubmit={this.handleSubmit}>
          <Form.Field>
      <label>Tier Name</label>
      <input name="tier_name"  value={this.state.tier_name} onChange={this.handleChange} />
    </Form.Field>
  
    <Form.Field>
      <label>Active</label>
      <input name="active"  value={this.state.active} onChange={this.handleChange} />
    </Form.Field>
    <Form.Field>
      <label>Description</label>
      <input name="description"  value={this.state.description} onChange={this.handleChange} />
      <input type="hidden"  name="id" value={this.state.id} />
    </Form.Field>
	<Form.Field>
      <label>Slot Available</label>
      <input name="slot_available"  value={this.state.slot_available} onChange={this.handleChange} />
    </Form.Field>
    
    <Button type='submit'>Submit</Button>
  </Form>
 
        </Modal.Body>
          <Modal.Footer>
            <Button onClick={this.handleHide1} >Close</Button>
          </Modal.Footer>
        </Modal>
      </ButtonToolbar>:''}

<ButtonToolbar>
        {/* <Button bsStyle="primary" onClick={this.handleShow}>
          Launch demo modal
        </Button> */}
        <label>
        <input  type="checkbox" onClick={this.handleShow} />I have read and accepted the terms and conditions
        </label>

        <Modal
          {...this.props}
          show={this.state.show}
          onHide={this.handleHide}
          dialogClassName="custom-modal"
        >
          <Modal.Header closeButton>
            <Modal.Title id="contained-modal-title-lg">
           <h2> Sponsorship Agreement</h2>

            </Modal.Title>
          </Modal.Header>
          <Modal.Body style={{'max-height': 'calc(100vh - 210px)', 'overflow-y': 'auto'}}>
            <h3>Terms of Service Agreement</h3>
            <p>
             
Revised Feb 24, 2020

<h4>1. ACCEPTANCE OF TERMS</h4>
PrepHero Inc. (hereafter referred to as “PrepHero”, the “Company”, “we,” “us,” and/or “our”), has provides its services (the “Service”), to you subject to the following Terms of Service (the “Terms”), which may be updated by us from time to time without notice to you. Please check these Terms periodically for changes.

By using the Service, you agree to be bound by these Terms, our Privacy Policy, all applicable laws and all conditions or policies referenced here.

The Company operates the Service under its own PrepSponsor Brand and under the Brands of its Business Partners. The Terms apply to you regardless of which Brand of Service you use.

In addition, when using the Service, you shall be subject to any guidelines or rules (the “Guidelines”) applicable that may be posted online from time to time. All such guidelines or rules are hereby incorporated by reference into the Terms.

You will not hold the Company responsible for others’ content, actions or inactions. You acknowledge that we have no control over and do not guarantee the quality, safety or legality of organizations promoted, the truth or accuracy of content, listings, or ability to perform the stated objective.

<h4>2. DESCRIPTION OF THE SERVICE AND DEFINITIONS</h4>
The Service is a simple, easy-to-use crowdfunding application that can easily be promoted via social media services, websites, and email.

Definitions:

“Campaign” is a fundraising project created using our Service, either to collect money for personal reasons or on behalf of an Organization.

“Campaign Owner” is the individual that created the Campaign.

Campaign Owners have access to features and tools for their Campaign including but not limited to tracking Contributions made to their Campaign, and editing details of their Campaign.

Campaign Owners may grant access to the features and tools of the Campaign to Users and the Users are subject to these Terms as agreed to by the Campaign Owner. If a Campaign Owner chooses to transfer or share ownership of their Campaign with another User, that User becomes a Campaign Owner and they will assume the aforementioned access and responsibilities.

“Contributor” is any individual or organization that contributes money to a Campaign. These typically include sponsor and individual or private entities that are providing money to a campaign.

“Contribution” is any financial transaction that benefits the Campaign.

Organization” may be a sports team, club, non-profit, school, political entity, business, or other social entity that has a collective goal.

“User” is any individual who has accepted the Terms by logging in to the Service through a Login Service or by contributing to a Campaign.

“Payment Provider” is a company that processes Contributions to Campaigns.

<h4>3. ELIGIBILITY</h4>
You are not eligible to use the service without consent if you are under 18 years of age. If you are between the ages of 13 and 17, you can use the Service with the consent and supervision of your parent or legal guardian who is at least 18 years old, provided that your parent or legal guardian also agrees to be bound by these Terms and agrees to be responsible for your use of the Service. You are not eligible to use the Service if you have previously been suspended from using the Service for any reason and we have not explicitly authorized you to resume using the Service. We reserve the right to refuse use of the Service to anyone and to reject, cancel, interrupt, remove or suspend a Campaign at any time for any reason without liability.

<h4>4. PAYMENT PROCESSING INFORMATION</h4>
All Contributions to Campaigns are processed through Stripe and managed by PrepHero.

i. Users of the Service are subject to and must adhere to the terms of the applicable Payment Providers’ Terms of Service and other agreements relating to their Service transactions. The Company is not affiliated with any Payment Provider, and neither is the agent or employee of the other, and neither is responsible in any way for the actions or performance (or lack thereof) of the other. The same is true with respect to the Company on the one hand and Users on the other hand. To the extent that the Service is rendered in conjunction with any other provider of services, the same shall also be true, namely that to the extent that a User of the Service hereunder does so in conjunction with the services of another service provider, such User will be subject to the other service provider’s terms of service, and neither the Company or the other service provider will be considered the agent or employee of the other, and neither will be responsible in any way for the actions or performance (or lack thereof) of the other. These Terms shall not in any way supersede the terms of any other service provider for using their service, nor shall the terms of service of any other service provider supersede the terms of the Terms with respect to the Service.

ii. By using the Service, all Users agree to the Payment Provider withholding a Service fee and making these fees available to the Company. For information on the Service fees see the Fee Schedule section below.

iii. Campaign Owners accept the responsibility to provide refunds to Contributors at their own discretion. The Company will NOT be held liable for refunds or lack thereof.

iv. Third Party Service Providers may be engaged to:

Issue tax receipts for donations to nonprofit organizations and/or pool donated funds in a Foundation and transfer a lump sum to the designated nonprofit. The Service Provider may charge a fee for these services that will be paid by the recipient of the funds.

<h4>5. FEE AND PAYOUT SCHEDULE</h4>
Every Campaign is free to create. The Service fee is 15%, including the payment processing fees. This fee is deducted from the contribution amount made from the contributor, resulting in a net payout to the organization of 85%. 

Campaign funds collected are paid out on the following schedule from the Company to the authorized representative:
<table >
  <tr>
    <th>
Campaign Fund Payout</th>
    <th>	
Portion of Net Payout Sent</th> 
  
  </tr>
  <tr>
    <td>1 month after cash receipt</td>
    <td>	

10%</td>
    
  </tr>
  <tr>
    <td>3 months after cash receipt</td>
    <td>	

25%</td>
   
  </tr>
  <tr>
    <td>6 months after cash receipt</td>
    <td>25%</td>
    
  </tr>
  <tr>
    <td>9 months after cash receipt</td>
    <td>25%</td>
    
  </tr>
  <tr>
    <td>12 months after cash receipt</td>
    <td>15%</td>
    
  </tr>
</table>

<h4>6. REFUND POLICY</h4>
Contributors MUST request any and all refunds directly from the Campaign Owner. Campaign Owners are liable for the contribution and sponsorship terms with the Contributors directly.  For Campaign Owners to receive a reimbursement of the Service fee, the Campaign Owner MUST process the refund to the Contributor within seven (7) days from the date of receiving the Contribution that is being refunded. Notify the Company directly within 7 days of the Contribution.

<h4>7. FURTHER SERVICE UNDERSTANDINGS</h4>
Unless explicitly stated otherwise, any new features that augment or enhance the Service, shall be subject to the Terms. You understand and agree that the Service is provided AS-IS and that the Company assumes no responsibility for the timeliness, deletion, mis-delivery or failure to store any communications or personalization settings.

<h4>8. CONTRIBUTORS</h4>
As a Contributor, you are solely responsible for asking questions and investigating Campaigns to the extent you feel is necessary before you make a Contribution. All Contributions are made voluntarily and at your sole discretion and risk. The Company doesn’t guarantee that Contributions will be used as promised, that Campaign Owners will deliver Incentives, or that the Campaign will achieve its goals. The Company does not endorse, guarantee, make representations, or provide warranties for or about the quality, safety, morality or legality of any Campaign, Incentive or Contribution, or the truth or accuracy of content posted on the Service. You are solely responsible for determining how to treat your Contribution and receipt of any Incentives for tax purposes. In the event you are issued a refund on your Contribution because of our inability to disburse funds to a Campaign Owner, you will no longer be entitled to delivery of any Incentives associated with your contribution.

<h4>9. INCENTIVES</h4>
Incentives may be referenced as Sponsorships, Gifts, Tiers, Incentives, Perks, Products or Tickets that are offered by Campaign Owners as motivators for Users to contribute to their Campaign. Campaign Owners agree to the following regarding Incentives:

a. You, the organization are solely responsible and liable for, and must fulfill the Incentives as presented in your Campaign;

b. If for any reason you are unable to fulfill an Incentive, you will work with the Contributor(s) to reach a mutually satisfactory resolution which may include, without limitation, issuing a refund in a timely fashion; and

c. The Company does not endorse or validate any Incentives nor accept any liability or responsibility for the fulfillment or lack thereof of Incentives.

<h4>10. TAXES</h4>
The Campaign Owner is solely responsible for:

- understanding that taxing authorities may classify funds raised through the Service as taxable income to the Campaign Owner and any beneficiary who will receive funds directly from the Campaign.

- determining how to treat and collect and remit any taxes on Contributions in connection with your Incentives - paying all fees and taxes associated with the use of the Service.

<h4>11. RAISING FUNDS ON BEHALF OF OTHERS</h4>
From time to time, Campaign Creators desire to raise money on behalf of Organizations and Individuals.

<h4>11.1 ORGANIZATIONS</h4>
To comply with federal, state and local laws, the Campaign Owner must upon request provide the Company and the Payment Provider with proof that the Organization has clearly authorized the Campaign Owner to act on its behalf. To apply to accept funds on behalf of another Organization, the Campaign Owner must submit upon request by email to the Payment Provider and the Company a Letter of Subordination on letterhead from the Organization and signed by an authorized Officer of that Organization that expressly grants the Campaign Creator the right to fundraise on behalf of the Organization. Samples of the format for this letter are available here. Copies of the documents should be sent to compliance@PrepHero.com.

<h4>11.2 INDIVIDUALS</h4>
Upon request by the Company, Campaign Owners must provide the Company with information and / or documentation that proves the Campaign Owner has authority or has been granted authority to raise funds on behalf of this individual, and clearly shows how the funds collected will be transferred to the individual or used to benefit the individual noted in the Campaign.

<h4>12. PROHIBITED ACTIVITIES</h4>
In addition to the activities listed in the Conduct section below, Campaign Owners are specifically prohibited from activities that violate the Payment Provider’s Acceptable Use Policies, Facebook’s Statement of Rights and Responsibilities, Google’s Terms of Service. Campaign Owners are also not allowed to act in any way that violates national, regional and local laws related to online commerce. In particular, by example and not limiting the definition in any way, Campaign Owners cannot run lotteries, raffles, pyramid schemes, gambling activities or any other form of prohibited financial activity using the Service.

In addition, we reserve without limitation, the right to remove offending Content, suspend or terminate the account of such violators, stop payments to any such Campaign, freeze or place a hold on Donations, and report you to law enforcement authorities or otherwise take appropriate legal action including seeking restitution on behalf of ourselves and/or our users.

Without limiting the foregoing, you agree not to use the Services to raise funds or establish or contribute to any Campaign with the implicit or explicit purpose of or involving campaigns we deem, in our sole discretion, to be in support of, or for the legal defense of alleged crimes associated with hate, violence, harassment, bullying, discrimination, terrorism, or intolerance of any kind relating to race, ethnicity, national origin, religious affiliation, sexual orientation, sex, gender or gender identity, or serious disabilities or diseases.

<h4>13. SET UP OBLIGATIONS</h4>
In consideration of your use of the Service, you agree to:

(a) provide true, accurate, current and complete information about yourself and your Organization as prompted during the Campaign creation process and any later administration processes (such information being the Set Up Data) and

(b) maintain and promptly update the Set Up Data to keep it true, accurate, current and complete. If you provide any information that is untrue, inaccurate, not current or incomplete, or the Company has reasonable grounds to suspect that such information is untrue, inaccurate, not current or incomplete, the Company has the right to suspend or terminate your use of the Service and refuse any and all current or future use of the Service (or any portion thereof).

<h4>14. SECURITY AND COMPLIANCE</h4>
You are responsible for maintaining the confidentiality of the Login Services, and are fully responsible for all activities that occur in your Login Service account as it relates to the Service. You agree to immediately notify the Company of any unauthorized use of your Login Service account or any other breach of security as it relates to the Service. The Company cannot and will not be liable for any loss or damage arising from your failure to comply with this Section.

You are also responsible to ensure all content in your campaign is compliant with the Terms Of Service & Privacy Policy of the Login Service(s).

<h4>15. CONDUCT</h4>
In using the Service, you understand that you are liable for all information, products or services, in whatever form, that you make available to other Users. You agree not to use the Service to:

- upload, post, email, transmit or otherwise make available any Information, products or services, that are unlawful, harmful, threatening, abusive, harassing, tortuous, defamatory, vulgar, obscene, libellous, invasive of another’s privacy, hateful, or racially, ethnically or otherwise objectionable;

- harm minors in any way; impersonate any person or entity, including, but not limited to, a Company representative, forum leader, or falsely state or otherwise misrepresent your affiliation with a person or entity;

- forge headers or otherwise manipulate identifiers in order to disguise the origin of any Information transmitted through the Service;

- upload, post, email, transmit or otherwise make available any Information, products or services, that you do not have a right to make available under any law or under contractual or fiduciary relationships (such as inside information, proprietary and confidential information learned or disclosed as part of employment relationships or under nondisclosure agreements);

- upload, post, email, transmit or otherwise make available any Information, products or services, that infringes any patent, trademark, trade secret, copyright or other proprietary rights (Rights) of any party;

- upload, post, email, transmit or otherwise make available any unsolicited or unauthorized advertising, promotional materials, junk mail, spam, chain letters, pyramid schemes, or any other form of solicitation, except in those areas that are designated for such purpose and within the scope of such designation;

- upload, post, email, transmit or otherwise make available any material that contains software viruses or any other computer code, files or programs designed to interrupt, destroy or limit the functionality of any computer software or hardware or telecommunications equipment;

- interfere with or disrupt the Service or servers or networks connected to the Service, or disobey any requirements, procedures, policies or regulations of networks connected to the Service;

- intentionally or unintentionally violate any applicable local, province, state, national or international law; or stalk or otherwise harass another.

You acknowledge that the Company does not pre-screen any Content working in coordination with the Service, but that the Company and its designees shall have the right (but not the obligation) in their sole discretion to rescind use of the Service.

You acknowledge and agree that the Company may preserve Information and may also disclose Information if required to do so by law or in the good faith belief that such preservation or disclosure is reasonably necessary to:

(a) comply with legal process;

(b) enforce the Terms;

(c) respond to claims that any Information violates the rights of third-parties; or

(d) protect the rights, property, or personal safety of the Company, its Users and/or the public. You understand that the technical processing and transmission of the Service, including your Information, may involve:

(a) transmissions over various networks; and

(b) changes to conform and adapt to technical requirements of connecting networks or devices.

<h4>16. SPECIAL ADMONITIONS FOR INTERNATIONAL USE</h4>
Recognizing the global nature of the Internet, you agree to comply with all local rules regarding online conduct and acceptable Information. Specifically, you agree to comply with all applicable laws regarding electronic commerce and charitable funding, and regarding the transmission of technical data exported from Canada or the country in which you reside.

<h4>17. INDEMNITY</h4>
You agree to indemnify and hold the Company, and its subsidiaries, affiliates, officers, directors, agents, co-branders or other partners, and employees, harmless from any claim or demand, including reasonable attorneys’ fees, made by any third party due to or arising out of Information you submit, post, transmit or make available through the Service, your use of the Service, your connection to the Service, your violation of the Terms, or your violation of any rights of another.

<h4>18. NO RESALE OF SERVICE</h4>
You agree not to reproduce, duplicate, copy, sell, resell or exploit for any commercial purposes, any portion of the Service, use of the Service, or access to the Service, other than as provided within the scope of the Service or if agreed to by written consent from the Company.

<h4>19. MODIFICATIONS TO SERVICE</h4>
The Company reserves the right at any time and from time to time to modify or discontinue, temporarily or permanently, the Service (or any part thereof) with or without notice. The Company will not be responsible to you for refund, in whole or part, of the Service fees for any reason. You agree that the Company shall not be liable to you or to any third party for any modification, suspension or discontinuance of the Service.

<h4>20. TERMINATION</h4>
You agree that the Company, in its sole discretion, may terminate your use of the Service, and remove and discard any Information within the Service, for any reason, including, without limitation, for lack of use, failure to timely pay any Service fees or other moneys due the Company, or if the Company believes that you have violated or acted inconsistently with the letter or spirit of the Terms. The Company may also in its sole discretion and at any time discontinue providing the Service, or any part thereof, with or without notice. You agree that any termination of your access to the Service under any provision of this Terms may be effected without prior notice, and acknowledge and agree that the Company may immediately deactivate or delete your Information and/or bar any further access to such files in the Service. Further, you agree that the Company shall not be liable to you or any third-party for any termination of your access to Service.

<h4>21. LINKS</h4>
The Company may provide, or third parties may provide, links to other World Wide Web sites or resources. Because the Company has no control over such sites and resources, you acknowledge and agree that the Company is not responsible for the availability of such external sites or resources, and does not endorse and is not responsible or liable for any content, advertising, products, or other materials on or available from such sites or resources. You further acknowledge and agree that the Company shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with use of or reliance on any such content, goods or services available on or through any such site or resource.

<h4>22. PUBLISHING AND COMMUNICATIONS</h4>
By creating their Campaign or publishing content, Campaign Owners and Contributors agree to their campaign images, videos, text or excerpts being made available for discovery in our Service Find pages and search engine results, as well as their appearance in Service-related communications or promotions or in news articles or reports on published on news media websites or print publications. Campaigns may be used as part of advertising campaigns to promote either the campaign or the Service in print, online or mobile. Private Campaigns will not be published in this manner.

<h4>23. THE COMPANY’S PROPRIETARY RIGHTS</h4>
You acknowledge and agree that the Service and any necessary software (Software) used in connection with the Service contain proprietary and confidential information that is protected by applicable intellectual property and other laws. You further acknowledge and agree that information presented to you through the Service is protected by copyrights, trademarks, service marks, patents or other proprietary rights and laws. Except as expressly authorized by the Company, you agree not to modify, rent, lease, loan, sell, distribute or create derivative works based on the Service or the Software, in whole or in part.

<h4>24. LICENSE</h4>
The Company grants you a limited, revocable, non-transferable and non-exclusive right and license to use the Service subject to your eligibility and continued compliance with these Terms; provided that you do not (and do not allow any third party to) copy, modify, create a derivative work of, reverse engineer, reverse assemble or otherwise attempt to discover any source code, sell, assign, sublicense, grant a security interest in or otherwise transfer any right in the Service. You agree not to modify the Service in any manner or form, or to use modified versions of the Service, including (without limitation) for the purpose of obtaining unauthorized access to the Service. You agree not to access the Service by any means other than through the interfaces or APIs that are provided by the Company for use in accessing Service.

<h4>25. DISCLAIMER OF WARRANTIES YOU EXPRESSLY UNDERSTAND AND AGREE THAT:</h4>
YOU EXPRESSLY UNDERSTAND AND AGREE THAT:

YOUR USE OF THE SERVICE IS AT YOUR SOLE RISK. THE SERVICE IS PROVIDED ON AN AS IS AND AS AVAILABLE BASIS. THE COMPANY EXPRESSLY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. THE COMPANY MAKES NO WARRANTY THAT

(i) THE SERVICE WILL MEET YOUR REQUIREMENTS,

(ii) THE SERVICE WILL BE UNINTERRUPTED, TIMELY, SECURE, OR ERROR-FREE,

(iii) THE RESULTS THAT MAY BE OBTAINED FROM THE USE OF THE SERVICE WILL BE ACCURATE OR RELIABLE,

(iv) THE QUALITY OF ANY PRODUCTS, SERVICES, INFORMATION, OR OTHER MATERIAL PURCHASED OR OBTAINED BY YOU THROUGH THE SERVICE WILL MEET YOUR EXPECTATIONS, AND

(v) ANY ERRORS IN THE SOFTWARE WILL BE CORRECTED.

<h4>26. LIMITATION OF LIABILITY</h4>
YOU EXPRESSLY UNDERSTAND AND AGREE THAT THE COMPANY SHALL NOT BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, CONSEQUENTIAL OR EXEMPLARY DAMAGES, INCLUDING BUT NOT LIMITED TO, DAMAGES FOR LOSS OF PROFITS, GOODWILL, USE, DATA OR OTHER INTANGIBLE LOSSES (EVEN IF THE COMPANY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES), RESULTING FROM:

(i) THE USE OR THE INABILITY TO USE THE SERVICE;

(ii) THE COST OF PROCUREMENT OF SUBSTITUTE GOODS AND SERVICES RESULTING FROM ANY GOODS, DATA, INFORMATION OR SERVICES PURCHASED OR OBTAINED OR MESSAGES RECEIVED OR TRANSACTIONS ENTERED INTO THROUGH OR FROM THE SERVICE;

(iii) UNAUTHORIZED ACCESS TO OR ALTERATION OF YOUR TRANSMISSIONS OR DATA;

(iv) STATEMENTS OR CONDUCT OF ANY THIRD PARTY ON THE SERVICE; OR

(v) ANY OTHER MATTER RELATING TO THE SERVICE.

<h4>27. EXCLUSIONS AND LIMITATIONS</h4>
SOME JURISDICTIONS DO NOT ALLOW THE EXCLUSION OF CERTAIN WARRANTIES OR THE LIMITATION OR EXCLUSION OF LIABILITY FOR INCIDENTAL OR CONSEQUENTIAL DAMAGES. ACCORDINGLY, SOME OF THE LIMITATIONS OF THE TERMS SECTIONS MAY NOT APPLY TO YOU.

REGARDLESS OF THE PREVIOUS PARAGRAPH, IF WE ARE FOUND TO BE LIABLE, OUR LIABILITY TO YOU OR TO ANY THIRD PARTY IS LIMITED TO THE GREATER OF

(A) THE TOTAL SERVICE FEES YOU PAID TO US IN THE 12 MONTHS PRIOR TO THE ACTION GIVING RISE TO THE LIABILITY, AND

(B) $100.

<h4>28. RELEASE</h4>
IF YOU HAVE A DISPUTE WITH ONE OR MORE USERS, YOU RELEASE US (AND OUR OFFICERS, DIRECTORS, AGENTS, SUBSIDIARIES, JOINT VENTURES AND EMPLOYEES) FROM CLAIMS, DEMANDS AND DAMAGES (ACTUAL AND CONSEQUENTIAL) OF EVERY KIND AND NATURE, KNOWN AND UNKNOWN, ARISING OUT OF OR IN ANY WAY CONNECTED WITH SUCH DISPUTES. IF YOU ARE A CALIFORNIA RESIDENT, YOU WAIVE CALIFORNIA CIVIL CODE 1542, WHICH SAYS: “A GENERAL RELEASE DOES NOT EXTEND TO CLAIMS WHICH THE CREDITOR DOES NOT KNOW OR SUSPECT TO EXIST IN HIS FAVOR AT THE TIME OF EXECUTING THE RELEASE, WHICH IF KNOWN BY HIM MUST HAVE MATERIALLY AFFECTED HIS SETTLEMENT WITH THE DEBTOR.”

<h4>29. NOTICE</h4>
Notices to you may be made via either email or regular mail. The Company may also provide notices of changes to the Terms or other matters by displaying notices or links to notices to you generally on the Service. Our mailing address is: PrepHero Inc, 3838 Bordeaux Dr., Northbrook, IL 60062.

<h4>30. TRADEMARK INFORMATION</h4>

PrepHero, trademarks and service marks, and other Company logos and product and service names are owned by and / or trademarks of PrepHero, Inc. Without the Company’s prior permission, you agree not to display or use in any manner, the PrepHero marks. PrepHero Business Partner and third party trademarks are the property of their respective owners.

<h4>31. GENERAL INFORMATION</h4>
a. Entire Agreement. The Terms constitutes the entire agreement between you and the Company and governs your use of the Service, superseding any prior agreements between you and the Company. You also may be subject to additional terms and conditions that may apply when you use affiliate services, third-party Information or third-party software.

b. Choice of Law. The Terms and the provision of the Service to you are governed by the laws of the state of Illinois (USA).

c. Arbitration. Any controversy or claim arising out of or relating to the Terms or the provision of the Service shall be finally settled by binding arbitration in accordance with the commercial arbitration rules observed by the American Arbitration Association. Any such controversy or claim shall be arbitrated on an individual basis, and shall not be consolidated in any arbitration with any claim or controversy of any other party. The arbitration shall be conducted in Chicago, Illinois, and judgment on the arbitration award may be entered in any court having jurisdiction thereof. However, you and the Company agree to submit to the personal jurisdiction of the courts located within the city of Chicago, IL. Either you or the Company may seek any interim or preliminary relief from a court of competent jurisdiction in Chicago, Illinois necessary to protect the rights or property of you or the Company (or its agents, suppliers, and subcontractors) pending the completion of arbitration.

d. Invalid Provisions. The failure of the Company to exercise or enforce any right or provision of the Terms shall not constitute a waiver of such right or provision. If any provision of the Terms is found by an arbitrator or court of competent jurisdiction to be invalid, the parties nevertheless agree that the arbitrator or court should endeavour to give effect to the parties’ intentions as reflected in the provision, and the other provisions of the Terms remain in full force and effect.

e. Time to File Claim. You agree that regardless of any statute or law to the contrary, any claim or cause of action arising out of or related to use of the Service or the Terms must be filed within one (1) year after such claim or cause of action arose or be forever barred.

f. Titles. The section titles in the Terms are for convenience only and have no legal or contractual effect.

<h4>32. VIOLATIONS</h4>
Please report any violations of the Terms of service to TOS-violations@PrepHero.com

Please be advised that accusations of illegal or immoral Campaign activities will only be responded to when communicated through properly formatted requests from law enforcement organizations.
            </p>
            
          </Modal.Body>
          <Modal.Footer>
            <Button onClick={this.handleHide} >Close</Button>
          </Modal.Footer>
        </Modal>
      </ButtonToolbar>

      <div className="button-center">
<button class="ui button" onClick={this.back}>
            Back
          </button>
          <div class="ui button" tabindex="0" onClick={this.saveAndContinue}>
            Save And Continue 
          </div>


          </div>

        <br /><br />
      </div>
    );

  }
 

}

export default StepConfirmation