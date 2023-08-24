
function initDropdown2s() {
	var dropdownChildren = document.querySelectorAll('.pure-menu-has-children .pure-menu-link');
	for (var i = 0; i < dropdownChildren.length; i++) {
			dropdownChildren[i].click();
	}
}

document.addEventListener('DOMContentLoaded', function(){ 
	//initDropdown2s();
})



const btn = document.querySelector(".btn-toggle");
const prefersLightScheme = window.matchMedia("(prefers-color-scheme: light)");

const currentTheme = localStorage.getItem("theme");
if (currentTheme == "dark") {
document.body.classList.toggle("dark-theme");
} else if (currentTheme == "light") {
document.body.classList.toggle("light-theme");
}

btn.addEventListener("click", function () {
if (prefersLightScheme.matches) {
	document.body.classList.toggle("dark-theme");
	var theme = document.body.classList.contains("dark-theme")
		? "dark"
		: "light";
} else {
	document.body.classList.toggle("light-theme");
	var theme = document.body.classList.contains("light-theme")
	? "light"
	: "dark";
}
localStorage.setItem("theme", theme);
});

