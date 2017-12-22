var distance = $('#Menu').offset().top,
    $window = $(window);

$(document).ready(function () {
    $(document).scroll(function () {
        if ($window.scrollTop() >= distance) {
            $("#Menu").addClass('MenuOnTop');
            $("#Content").addClass('ContentStep');
        } else {
            $("#Menu").removeClass('MenuOnTop');
            $("#Content").removeClass('ContentStep');
        }
    });
});