
    $("#persons").change(function() {
        const booking = $("form[name='cntnd_booking-reservation'] input[name='booking']:checked");
        const priceId = booking.data("price-id");
        const persons = $(this).val();
        if (booking.val() !== undefined && priceId !== undefined && persons > 0) {
            updateCart(booking.val(), persons, priceId);
        }
    });


    $("form[name='cntnd_booking-reservation'] input[name='booking']").change(function() {
        const booking = $(this);
        const priceId = booking.data("price-id");
        const persons = $("#persons").val();
        if (booking.val() !== undefined && priceId !== undefined && persons > 0) {
            updateCart(booking.val(), persons, priceId);
        }
    });

    function updateCart(booking, persons, priceId) {
        const date = moment(booking, "YYYYMMDDHHmm");
        const price = prices[priceId][persons];
        $("#cart_reservation_title").text("Reservation für " + persons + " Person(en) am " + date.format("DD.MM.YYYY HH:mm"));
        $("#cart_reservation_price").text(price+" CHF");
        $("#cart_total").text(price);
    }