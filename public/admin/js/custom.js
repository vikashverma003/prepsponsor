/*********************CODE*****************/
$(document).ready(function() {
var max_fields      = 10; //maximum input boxes allowed
var wrapper   = $(".input_fields_wrap"); //Fields wrapper
var add_button      = $(".add_field_button"); //Add button ID

var x = 1; //initlal text box count
$(add_button).click(function(e){ //on add input button click
e.preventDefault();
if(x < max_fields){ //max input box allowed
x++; //text box increment
$(wrapper).append('<div class="form-group"><div class="row"><div class="col-md-3"><input type="text" class="form-control" name="member_firstname[]" id="member_firstname" placeholder="First Name"></div><div class="col-md-3"><input type="text" class="form-control" name="member_lastname[]" id="member_lastname" placeholder="Last Name"></div><div class="col-md-6"><input type="email" class="form-control" name="member_email[]" id="member_email" placeholder="Email Address"></div><a href="#" class="remove_field">Remove</a></div></div>');
}
});

$(wrapper).on("click",".remove_field", function(e){ //user click on remove text
e.preventDefault(); $(this).parent('div').remove(); x--;
})
});
