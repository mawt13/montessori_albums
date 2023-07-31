
function initDropdown2s() {
	var dropdownChildren = document.querySelectorAll('.pure-menu-has-children .pure-menu-link');
	for (var i = 0; i < dropdownChildren.length; i++) {
			dropdownChildren[i].click();
	}
}

document.addEventListener('DOMContentLoaded', function(){ 
	//initDropdown2s();
})