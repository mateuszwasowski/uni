window.setTimeout(function()
 {
$(".alert").fadeTo(500, 0).slideUp(500, function()
{
$(this).remove();
});
}, 4000);


$("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
});
