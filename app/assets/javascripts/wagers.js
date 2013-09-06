
// New Page

$(document).ready(function(){
	
	//When host adds terms
	var addTermBox = $('.host_add_button').on('click', function(){
		//hide the '+' button
		$('.host_add_button').hide();
		//insert next term field with new '+' button
		$('.host_terms input').last().after('\
			<div class="large-11 columns">\
          		<input type="text" placeholder="You have to do it naked">\
          	</div>\
          	<div class="large-1 columns">\
          		<a href="#" class="button small host_add_button">+</a>\
          	</div>\
        ');
        // addTermBox();
	});

	//When guest adds terms
	// $('.guest_add_button').
});