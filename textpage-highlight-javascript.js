
// 1. function to highlight nationalism
function highlightNationalism() {
    var checkBox = document.getElementById("myCheck");
    var nationalism = document.getElementById("nationalism");
    if (checkBox.checked == true){
        nationalism.style.color="green";
    } else {
        nationalism.style.color="black";
    }
}
                