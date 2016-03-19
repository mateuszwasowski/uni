$(function() {
      var $folder = $( "#folder" ),
          $availableFile = $("#availableFile"),
          $inaccessibleFile = $("#inaccessibleFile"),
          $availableFileDiv = $("#availableFileDiv");
    $availableFile.draggable({
      cancel: false,
      revert: "invalid",
      containment: "document",
      cursor: "move",
    });
    $inaccessibleFile.draggable({
       cancel: false,
       revert: "invalid",
    });
    $folder.droppable({
      accept: $availableFile,
      drop: function( event, ui ) {
          $availableFile.hide( "drop", { direction: "up" }, "slow" );
          $availableFileDiv.remove();
        //AJAX
      }
    });
    $( "#download" ).mouseenter(function() {

      $("#infoDiv").hide();
      $("#download").css('width: 100%');
      $( "#download" ).button({label: "Download"});
      $( "#downloadDiv" ).removeClass( "col-lg-6" );
      $( "#downloadDiv" ).addClass( "col-lg-12");

    });

    $( "#download" ).mouseleave(function() {
      $( "#download" ).button({label: ""});
      $( "#downloadDiv" ).removeClass( "col-lg-12" );
      $("#infoDiv").show();
      $( "#downloadDiv" ).addClass( "col-lg-6" );
    });

    $( "#info" ).mouseenter(function() {
      $("#downloadDiv").hide();
      $( "#infoDiv" ).removeClass( "col-lg-6" );
      $( "#infoDiv" ).addClass( "col-lg-12");
      $("#info").css('width: 10%');
      $( "#info" ).button({label: "Info"});

    });

  $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
  });
    $( "#info" ).mouseleave(function() {
      $( "#info" ).button({label: ""});
      $( "#infoDiv" ).removeClass( "col-lg-12" );
      $("#downloadDiv").show();
      $( "#infoDiv" ).addClass( "col-lg-6" );
    });
  });
