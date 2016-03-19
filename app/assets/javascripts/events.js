$(document).ready(function() {
	// alert('hello');

	$('.search-tag').bind('click', function() {
		$(this).remove();
	});

	$('.evnt-tag').bind('click', function() {
		$('.search-tags').append('<span class="hashtag search-tag">' + $(this).text() + '</span>');
	});
})