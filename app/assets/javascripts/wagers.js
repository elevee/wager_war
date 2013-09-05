
// New Page

$(document).ready(function(){
	
	//When host adds terms
	$('.host_add_button').click(function(){
		$('.host_terms input').last().append('\
			<div class="large-11 columns">\
          		<input type="text" placeholder="You have to do it naked">\
          	</div>\
          	<div class="large-1 columns">\
          		<a href="#" class="button small host_add_button">+</a>\
          	</div>\
        ');
	});

	//When guest adds terms
	// $('.guest_add_button').
});