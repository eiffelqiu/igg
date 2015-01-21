var style = document.createElement('STYLE');
var css = '.ig_debug { display: none; } #debug_button { width: 13px; height: 13px; background-image:url(data:image/png;base64,R0lGODlhDQANALMAANvb25SUlHh4eNra2oaGhuLi4t/f3+vr6+jo6Ozs7HNzc1NTUwAAAAAAAAAAAAAAACH5BAEAAAwALAAAAAANAA0AAARMUClBAqFWSDUMOogHGoM0FMeSIMlyFCXntXQYA0bBqkhhABJRa6EaSVDEJPEVZA1VK8MxpVwWmolnNjQlJg5DpkIE0h2Mk0pGfVFEAAA7); cursor: pointer; position: absolute; left: 10px; bottom: 10px; z-index: 1000;'
style.type = 'text/css';
style.innerHTML = css;
document.getElementsByTagName('HEAD')[0].appendChild(style);

$(document).ready(function() {
	
	$('body').prepend('<div id="debug_button"></div>');
						   
	$('#debug_button').click(function() {
		if ($('.ig_debug').is(':visible')) {
			$('#debug_button').animate({ bottom: 10 });
		} else {
			$('#debug_button').animate({ bottom: 40 });
		}	
		$('.ig_debug').slideToggle();			
	});
});