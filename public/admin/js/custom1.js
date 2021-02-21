
// $(document).ready(function(){

//     $('select').change(function(){
//         if($('select option:selected').text() == "Other"){
//         $('.other').show();
//         // alert(231);
//         }
//         else{
//         	//alert(23);
//         $('.other').hide();
//         }
//     });
// 	});
// alert(12);
$(document).ready(function(){

$("select").change(function () {
	
  var numInputs = $(this).val();
  // alert(numInputs);
  if(numInputs ==="Other")
  {
 $(".other-name").append('<input name="main_activity" placeholder="other main activity" />');
  	// alert(numInputs);
  // for (var i = 0; i < numInputs; i++)
  //   $(".other-name").append('<input name="inputs" />');
  }
   else
  {
  	$('.other-name').hide();
  }
});
});