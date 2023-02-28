//make sure to use defer when using js as external file

let menuBtn=document.querySelector("#menuBtn");
let sidenav=document.querySelector("#sidenav");
let menu=document.querySelector("#menu");//mneu id is for menu-img

sideNav.style.right="-250px";

menuBtn.onclick=function () {
     if (sideNav.style.right=="-250px") {
          sideNav.style.right="0px"
          menu.src="close.png";//to change the icon
     }
     else{ 
          sideNav.style.right="-250px"
          menu.src="menu.png";
     }
}
var scroll = new SmoothScroll('a[href*="#"]', {
	speed: 1000,
	speedAsDuration: true
});