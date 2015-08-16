"use strict";
$(document).ready(function() {
    $(".select2-select-00").select2({
        allowClear: true
    });
    $(".select2-select-01").select2({
        minimumInputLength: 3
    });
    $(".select2-select-02").select2({
        tags: ["Sport", "Gadget", "Politics"]
    });
    if ($.fn.spinner) {
        $("#spinner-default").spinner();
        $("#spinner-decimal").spinner({
            step: 0.01,
            numberFormat: "n"
        });
        $("#culture").change(function() {
            var a = $("#spinner-decimal").spinner("value");
            Globalize.culture($(this).val());
            $("#spinner-decimal").spinner("value", a)
        });
        $("#currency").change(function() {
            $("#spinner-currency").spinner("option", "culture", $(this).val())
        });
        $("#spinner-currency").spinner({
            min: 5,
            max: 2500,
            step: 25,
            start: 1000,
            numberFormat: "C"
        });
        $("#spinner-overflow").spinner({
            spin: function(a, b) {
                if (b.value > 10) {
                    $(this).spinner("value", -10);
                    return false
                } else {
                    if (b.value < -10) {
                        $(this).spinner("value", 10);
                        return false
                    }
                }
            }
        });
        $.widget("ui.timespinner", $.ui.spinner, {
            options: {
                step: 60 * 1000,
                page: 60
            },
            _parse: function(a) {
                if (typeof a === "string") {
                    if (Number(a) == a) {
                        return Number(a)
                    }
                    return + Globalize.parseDate(a)
                }
                return a
            },
            _format: function(a) {
                return Globalize.format(new Date(a), "t")
            }
        });
        $("#spinner-time").timespinner();
        $("#culture-time").change(function() {
            var a = $("#spinner-time").timespinner("value");
            Globalize.culture($(this).val());
            $("#spinner-time").timespinner("value", a)
        });
        $("#spinner-validation").spinner()
    }
});