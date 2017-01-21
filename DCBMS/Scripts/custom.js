$(function () {
    $(".dateCalander").daterangepicker({
        locale: {
            format: "YYYY-MM-DD"
        },
        singleDatePicker: true,
        showDropdowns: true,
        opens: "left"
    },
        function (start, end, label) {
            var years = moment().diff(start, 'years');
            //alert("You are " + years + " years old.");
        });
});