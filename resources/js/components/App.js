  import React, { Component } from 'react'
    import ReactDOM from 'react-dom'
    import { BrowserRouter, Route, Switch } from 'react-router-dom'
    import Header from './Header'
    import NewProject from './NewProject'
    import ProjectsList from './ProjectsList'
    import SingleProject from './SingleProject'
  //  import form4 from './form4'
    import MainForm from './semantic/MainForm'

   import {Jumbotron} from './Jumbotron'

import { Container } from 'semantic-ui-react';

    class App extends Component {
      render () {
        return (
            <div className="step-container">
			             <Container >
						  <Jumbotron />
						  
        <MainForm />
      </Container>             
            </div>
        )
      }
    }

    ReactDOM.render(<App />, document.getElementById('app'))