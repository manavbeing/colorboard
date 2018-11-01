 //load color picker
  $(document).ready(function(){
    $(".colors").minicolors({
      position: 'bottom left',
      inline: true
    });
  })
  
  function Changeclass(x){
    if ($(x).hasClass("chosen")){
      $(x).removeClass("chosen");
      alert("Block unselected");
    }
    else{
      $(x).addClass("chosen");
      alert("Block selected");
    }
  }
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
        url: "/primary/board_coloring",
        data: {tiles: selectedboard.join(","),color_code: selectedColor}
      });
    }
    window.setInterval(refreshTile,3000);
  } 