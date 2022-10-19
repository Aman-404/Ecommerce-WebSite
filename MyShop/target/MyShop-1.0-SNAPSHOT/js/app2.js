//For Register page
const inputs = document.querySelectorAll(".input");


function addcl(){
	let parent = this.parentNode.parentNode;
	parent.classList.add("focus");
}

function remcl(){
	let parent = this.parentNode.parentNode;
	if(this.value == ""){
		parent.classList.remove("focus");
	}
}


inputs.forEach(input => {
	input.addEventListener("focus", addcl);
	input.addEventListener("blur", remcl);
});
// Vanish in 5 seconds
      setTimeout(() => document.querySelector('.myalert1').remove(), 5000);
      setTimeout(() => document.querySelector('.myalert1').remove(), 5000);
