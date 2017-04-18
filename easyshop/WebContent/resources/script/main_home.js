$(document).ready(onHomePageLoad);

function onHomePageLoad(){
	switchCategory();
}

function myFunction() {
	document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
	if (!event.target.matches('.dropbtn')) {

		var dropdowns = document.getElementsByClassName("dropdown-content");
		var i;
		for (i = 0; i < dropdowns.length; i++) {
			var openDropdown = dropdowns[i];
			if (openDropdown.classList.contains('show')) {
				openDropdown.classList.remove('show');
			}
		}
	}
}

//switch category drop down options
var switchCategory =function() {
	$("#categories").change(
			function() {
				document.location.href = $(this).find(":selected").data("href");
			});
}