function emboldenMunged() {
    var mungeds = document.getElementsByClassName("munged");
    unembolden_re = new RegExp(" ?embolden", "g");
    for (var i=0, il = mungeds.length; i<il; ++i) {
        melem = mungeds[i]
        if (document.getElementById("emboldenbox").checked) {
            melem.className += " embolden";
        }
        else {
            melem.className = mungeds[i].className.replace(unembolden_re,"");
        }
    }
}
function toggleHideWtf() {
    elem = document.getElementById("wtfSection");
    if (elem.style.display == "") {
        elem.style.display = "none";
    }
    else {
        elem.style.display = "";
    }
}
function toggleHideFavorites() {
    elem = document.getElementById("searchFavorites");
    console.log(elem.style.display)
    if (elem.style.display == "") {
        elem.style.display = "none";
    }
    else {
        elem.style.display = "";
    }
}
function toggleHideRecents() {
    elem = document.getElementById("searchRecents");
    if (elem.style.display == "") {
        elem.style.display = "none";
    }
    else {
        elem.style.display = "";
    }
}
window.onload = function() { 
    emboldenMunged();  
};

