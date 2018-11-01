 //load color picker
  $(document).ready(function(){
    $(".colors").minicolors({
      position: 'bottom left',
      inline: true
    });
  })
  
   function Changeboardcolor(){
    if ($(".chosen").size() == 0){
      alert("Please select a square!")
    }
    else{
      selectedColor = $(".colors").val();
      selectedboard = []
      $(".chosen").map(function() {
        $(this).css("background-color",selectedColor);
        selectedboard.push($( this ).attr("id"))
      });
      $.ajax({
        type: "POST",
        beforeSend: function(xhr) {
                      xhr.setRequestHeader('X-CSRF-Token', 
                      $('meta[name="csrf-token"]').attr('content'))
                    },
        url: "/primary/Changeblockcolor",
        data: {boards: selectedboard.join(","),color: selectedColor}
      });
    }
    
  } function Changeclass(x){
    if ($(x).hasClass("chosen")){
      $(e).removeClass("chosen");
      alert("Block unselected");
    }
    else{
      $(e).addClass("chosen");
      alert("Block selected");
    }
  }