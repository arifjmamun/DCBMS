$(document).ready(function () {
    var selectTestDropDown = $("#selectTestDropDown");

    selectTestDropDown.on("change", function () {
        var testName = $(this).val();
        if (testName !== "") {
            $.ajax({
                type: "POST",
                url: "../Services/AjaxHandler.asmx/LoadTestFee",
                data: '{testName:"' + testName + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $("#feeTextBox").val(response.d);
                }
            });
        } else {
            $("#feeTextBox").val("");
        }
    });

});