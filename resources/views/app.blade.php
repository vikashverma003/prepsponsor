    <!DOCTYPE html>
    <html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- CSRF Token -->
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>Prepsponsor</title>
		<link rel="icon" href="{!! asset('public/assets/PrepHero_P_Icon.png') !!}"/>

		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

          <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.css"></link>
		
		<script
		  src="https://code.jquery.com/jquery-3.1.1.min.js"
		  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
		  crossorigin="anonymous"></script>
		<script src="/semantic/dist/semantic.min.js"></script>
        <!-- Styles -->
        <link href="{{ asset('/public/css/app.css') }}" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div id="app"></div>

        <script src="{{ asset('/public/js/app.js') }}"></script>
		<script
type="text/javascript"
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC9LzvwwGQdZwyZ3zF8mK477oPtEPlt0Rk&libraries=places"
></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/15.1.0/react.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/15.1.0/react-dom.min.js"></script>
    </body>
    </html>
