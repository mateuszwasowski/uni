window.setTimeout(function()
 {
$(".alert").fadeTo(500, 0).slideUp(500, function()
{
$(this).remove();
});
}, 4000);
window.setTimeout(function()
 {
$(".alert-success").fadeTo(500, 0).slideUp(500, function()
{
$(this).remove();
});
}, 4000);
window.setTimeout(function()
 {
$(".alert-danger").fadeTo(500, 0).slideUp(500, function()
{
$(this).remove();
});
}, 4000);

$("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
});
