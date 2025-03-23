$(function(){
    $("<h1>GNOMIKA</h1><div class=\"titleinformation\"><nav><ul><li><a href=\"introduction.html\">Introduction</a></li> <li><a href=\"mss_list.html\">List of manuscripts</a></li> <li><a href=\"collections.html\">Collections</a></li> <li><a href=\"integated_editions.html\">Integrated editions</a></li></ul></nav></div>").
    prependTo(".dummyHeader");
  });

  document.addEventListener("DOMContentLoaded", function() {
    let currentDate = document.querySelector("#currentDayTime");
    // rest of your code goes here

/**   var diplomaticCheckbox = document.getElementById("diplomatic-checkbox");
  var transcriptionCheckbox = document.getElementById("transcription-checkbox");*/

  var tests = document.getElementsByClassName("toggleButton");
for(i = 0; i < tests.length; i++) {
    console.log(i);
    tests[i].addEventListener('click', function() {
    console.log(this.className);
    console.log(this.getAttribute('value'));
    var id = this.getAttribute('value');
    const container = document.getElementById(id);
    //container.classList.toggle('show');
 
//    var x = document.getElementById("myDIV");
    if (container.style.display === "none") {
    container.style.display = "flex";
            } else {
            container.style.display = "none";
  }
} 
      
//            const nodes = this.querySelectorAll("span.popuptext");
//            for(t = 0; nodes.length; t++) {
//                nodes[t].classList.toggle("show");
//            }
});
}
      
  var popups = document.getElementsByClassName("innerTextBlock");
  for(i = 0; i < popups.length; i++) {
    console.log("hej");
    
          popups[i].addEventListener('click', function() {
            console.log("hej");
            const nodes = this.querySelectorAll("span.popuptext");
            for(t = 0; nodes.length; t++) {
                nodes[t].classList.toggle("show");
            }
                        
          });
  }


  /**transcriptionCheckbox.checked = true;
  



  diplomaticCheckbox.addEventListener('change', function() {
      
      const cols = document.getElementsByClassName("diplomatic");
      
      if(this.checked) {
          for(i = 0; i < cols.length; i++) {
              cols[i].style.display = "inline-block";
          }
      }
      else{
          for(i = 0; i < cols.length; i++) {
              cols[i].style.display = "none";
          }
      }
      
  });*/
  
  window.addEventListener("load", (event) => {
      console.log("page is fully loaded");
    });
  
  /**transcriptionCheckbox.addEventListener('change', function() {
  
      //const elements = document.getElementsByClassName("transcription");
      
      var cols = document.getElementsByClassName("transcription");
      
  
      if(this.checked) {
          for(i = 0; i < cols.length; i++) {
              cols[i].style.display = "inline-block";
          }
      }
      else{
          for(i = 0; i < cols.length; i++) {
              cols[i].style.display = "none";
          }
      }
      
  });*/
  
  function myFunction(element) {
      var tex = element.nextSibling.innerHTML;
      if (tex != "") {
          alert(tex);
      }
      else {
          alert("has no relations")
      }
  }
  
  function displayDiplomatic() {
      var cols = document.getElementsByClassName("diplomatic");
      for(i = 0; i < cols.length; i++) {
          cols[i].style.display = "block";
      }
  
      var cols2 = document.getElementsByClassName("transcription");
      for(i = 0; i < cols2.length; i++) {
          cols2[i].style.display = "none";
      }
  }
  
  function displayTranscription() {
      var cols = document.getElementsByClassName("diplomatic");
      for(i = 0; i < cols.length; i++) {
          cols[i].style.display = "none";
      }
  
      var cols2 = document.getElementsByClassName("transcription");
      for(i = 0; i < cols2.length; i++) {
          cols2[i].style.display = "block";
      }
  }
  
  function show(element) {
      console.log("test");
      var popups = element.getElementsByClassName("popuptext");
      for(i = 0; i < popups.length; i++) {
          popups[i].classList.toggle("show");
      }
  }


});
