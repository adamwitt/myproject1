function disable_auto_complete() {
if (!document.getElementById) return false;
var g = document.getElementById('gym_search_form');
g.setAttribute("autocomplete", "off");

var f = document.getElementById('name_search_form');
f.setAttribute("autocomplete", "off");

}