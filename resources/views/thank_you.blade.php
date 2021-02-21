<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>app.prepsponsor.com</title>
  <script src="https://bootstrapcreative.com/wp-bc/wp-content/themes/wp-bootstrap/codepen/bootstrapcreative.js?v=1"></script>
  
  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css'>

</head>

<body>

	<div class="container">
   <div class="jumbotron text-xs-center" style="height:1000px;"> 
  <h1 class="display-3">Thank You!</h1>
  <p>Your donation  has been received and our organization is appreciative!  We’ll be following up shortly with information on next steps as well as about our programs.  If you need to reach me or anyone else at {{$team->group_name}} earlier, please feel free to contact us.</p>

<div class="col-lg-1">
<p>{{$team->first_name}} {{$team->last_name}}</p>
<p>{{$team->group_name}}</p>
<p>
{{ $team->phone === null ? +2323343434 : $team->phone }}

</p>
<p>app.prepsponsor.com</p>
</div>
  
 </div> 
 </div>
 

</body>

</html>
