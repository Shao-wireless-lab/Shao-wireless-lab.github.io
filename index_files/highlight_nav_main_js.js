function unshow_hidden_box() {
	$('div.hidden_box').slideUp('slow');
}

function show_hidden_box(anc) {
	if (anc.length == 0) {
		if (window.location.hash.length) {
			var anc=window.location.hash.split('#')[1];
		}
		else {
			return;
		}
	}
	var all = $('div.hidden_box');
	var i;
	window.location.hash = '#' + anc;
	for (i=0; i<all.length; i++) {
		if ($(all[i]).is(':visible')) {
			$.scrollTo('#wrapper', 800, function() {$(all[i]).slideUp('slow', function() {$('#' + anc).slideDown('slow');})});
			return;
		}
	}
	$.scrollTo('#wrapper', 800, function() {$('#' + anc).slideDown('slow')});
}

function highlight_nav_with_name(id_of_indicator) {
	var indicators = document.getElementById(id_of_indicator).className;
	if (indicators.length == 0) {
		return;
	}
	var i;
	indicators = indicators.split("|");
	var j;
	for (j=0; j<indicators.length; j++) {
		var indicator = indicators[j];
		var els = document.getElementsByName(indicator);
		for (i=0; i<els.length; i++) {
			els[i].parentNode.className = "highlight";
		}
	}
}

function highlight_nav_with_id(id_of_indicator) {
	var indicator = document.getElementById(id_of_indicator).className;
	document.getElementById(indicator).className = "highlight";
}

function highlight_nav_both() {
	highlight_nav_with_name('nav_sub_indicator');
	highlight_nav_with_id('nav_main_indicator');
	highlight_nav_with_name('nav_subsub_indicator');
}




function unhide_box_from_hash() {
	var anc = window.location.hash;
	if (anc.length != 0) {
		document.getElementById(anc.split('#')[1]).style.display = 'inline';
	}
}

function unhide_hash(anc) {
	window.location.hash = '#' + anc;
	unhide_box_from_hash(anc);
}
