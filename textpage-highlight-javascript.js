
// 1. function to highlight nationalism
function highlightNationalism() {
    var checkBox = document.getElementById("myCheckOne");
    var x = document.getElementsByClassName("nationalism");
    if (checkBox.checked == true){
        for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="#E389B9"; //pink
        }
        
    } else {
       for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="";
        }
    }
}

//2. function to highlight liberty
function highlightLiberty() {
    var checkBox = document.getElementById("myCheckTwo");
    var x = document.getElementsByClassName("liberty");
    if (checkBox.checked == true){
        for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="#0080FF";
        }
        
    } else {
       for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="";
        }
    }
}

//3. function to highlight gov
function highlightGov() {
    var checkBox = document.getElementById("myCheckGov");
    var x = document.getElementsByClassName("gov"); 
    if (checkBox.checked == true){
        for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="red";
        }   
    } else {
       for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="";
        }
    }
}

//4. function to highlight citizenship
function highlightCitizenship() {
    var checkBox = document.getElementById("myCheckCitizen");
    var x = document.getElementsByClassName("citizenship");
    if (checkBox.checked == true){
        for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="#6593FS"; //"cornflower"
        }
    } else {
       for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="";
        }
    }
}

//5. function to highlight vote
function highlightVote() {
    var checkBox = document.getElementById("myCheckVote");
    var x = document.getElementsByClassName("vote");
    if (checkBox.checked == true){
        for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="#89CFF0"; // "baby blue"
        }
    } else {
       for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="";
        }
    }
}

//6. function to highlight protest
function highlightProtest() {
    var checkBox = document.getElementById("myCheckProtest");
    var x = document.getElementsByClassName("protest");
    if (checkBox.checked == true){
        for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="#7285AS"; //"pigeon"
        }
    } else {
       for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="";
        }
    }
}

//7. function to highlight assembly
function highlightAssembly() {
    var checkBox = document.getElementById("myCheckAssembly");
    var x = document.getElementsByClassName("assembly");
    if (checkBox.checked == true){
        for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="#B0DFE5"; //"powder"
        }
    } else {
       for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="";
        }
    }
}

//8. function to highlight legal
function highlightLegal() {
    var checkBox = document.getElementById("myCheckLegal");
    var x = document.getElementsByClassName("legal");
    if (checkBox.checked == true){
        for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="#4682B4"; // "steel"
        }
    } else {
       for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="";
        }
    }
}
  
//9. function to highlight racial-equality
function highlightRace() {
    var checkBox = document.getElementById("myCheckRace");
    var x = document.getElementsByClassName("racial-equality");
    if (checkBox.checked == true){
        for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="#7EF9FF"; //"electric"
        }
    } else {
       for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="";
        }
    }
}

//10. function to highlight misc
function highlightMisc() {
    var checkBox = document.getElementById("myCheckMisc");
    var x = document.getElementsByClassName("misc");
    if (checkBox.checked == true){
        for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="#4F97A3"; //"turkish blue"
        }
    } else {
       for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="";
        }
    }
}

//11. function to highlight capital
function highlightCapital() {
    var checkBox = document.getElementById("myCheckCapital");
    var x = document.getElementsByClassName("capital");
    if (checkBox.checked == true){
        for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="#658354"; //dark green
        }
    } else {
       for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="";
        }
    }
}

//12. function to highlight symbols
function highlightSymbols() {
    var checkBox = document.getElementById("myCheckSymbols");
    var x = document.getElementsByClassName("symbols");
    if (checkBox.checked == true){
        for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="#c7ddb5"; //light green
        }
    } else {
       for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="";
        }
    }
}

//13. function to highlight russian
function highlightRussian() {
    var checkBox = document.getElementById("myCheckRussian");
    var x = document.getElementsByClassName("russian");
    if (checkBox.checked == true){
        for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="#514066"; // darker purple
        }
    } else {
       for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="";
        }
    }
}

//14. function to highlight native lang
function highlightNative() {
    var checkBox = document.getElementById("myCheckNative");
    var x = document.getElementsByClassName("native");
    if (checkBox.checked == true){
        for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="#8d70b3"; //light purple
        }
    } else {
       for(var i=0; i<x.length; i++){
           x[i].style.backgroundColor="";
        }
    }
}
