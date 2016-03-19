$(document).ready(function() {
	// alert('hello');

	$('.search-tags').delegate('.search-tag', 'click', function() {
		$(this).remove();
	});

	$('.evnt-tag').bind('click', function() {
		$('.search-tags').append('<span class="hashtag search-tag">' + $(this).text() + '</span>');
	});
})