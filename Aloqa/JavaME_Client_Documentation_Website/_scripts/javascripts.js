// JavaScript Document
function show_produkt(which) {
	document.getElementById("produkt1").style.display = "none";
	document.getElementById("produkt2").style.display = "none";
	document.getElementById("produkt3").style.display = "none";
	document.getElementById("produkt4").style.display = "none";
	document.getElementById("produkt"+which).style.display = "block";
}