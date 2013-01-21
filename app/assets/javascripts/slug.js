$(document).ready(function(){
	$(".slug-input").keyup(function() {
		$(".slug-output")[0].value = URLify($(this)[0].value, $(this)[0].length);
	})

	$('.checkbox').click (function (){
		if ($(this).is (':checked'))
			$(".slug-output")[0].setAttribute('disabled', 'disabled');
		else
			$(".slug-output")[0].removeAttribute('disabled');
	});
})