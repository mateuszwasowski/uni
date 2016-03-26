window.fbAsyncInit = function() {
  FB.init({
    appId: '239282999749784',
    xfbml: true,
    version: 'v2.5'
  });
};

(function(d, s, id) {
  var js,
    fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) {
    return;
  }
  js = d.createElement(s);
  js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js";
  fjs.parentNode
    .insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));


window
  .setTimeout(function() {
    $(".alert")
      .fadeTo(500, 0)
      .slideUp(500, function() {
        $(this).remove();
      });
  }, 4000);
window
  .setTimeout(function() {
    $(".alert-success")
      .fadeTo(500, 0)
      .slideUp(500, function() {
        $(this).remove();
      });
  }, 4000);
window
  .setTimeout(function() {
    $(".alert-danger")
      .fadeTo(500, 0)
      .slideUp(500, function() {
        $(this).remove();
      });
  }, 4000);

$("#menu-toggle")
  .click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
  });
