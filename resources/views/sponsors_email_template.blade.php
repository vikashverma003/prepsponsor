@component('mail::message')
# Payment for the sponsorship
<?php
//$team_id  =trim($data['team_id']);
$team_id  =466;
?>
Click here for the Sponsorhip package Option
@component('mail::button', ['url' => "https://app.prepsponsor.com/admin/selectPackage/$team_id"])
Packages Information
@endcomponent


Thanks,<br>
{{ config('app.name') }}
@endcomponent
