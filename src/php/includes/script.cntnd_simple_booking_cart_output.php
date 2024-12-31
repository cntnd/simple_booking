
    $(function () {
        const booking = $("form[name='cntnd_booking-reservation'] input[name='booking']:checked");
        const priceId = booking.data("price-id");
        const persons = $("#persons").val();

        if (booking.val() !== undefined && priceId !== undefined && persons > 0) {
            updateCart(booking.val(), persons, priceId);
        }
    });

    $("#persons").change(function() {
        const booking = $("form[name='cntnd_booking-reservation'] input[name='booking']:checked");
        const priceId = booking.data("price-id");
        const persons = $(this).val();

        if (persons === undefined || persons === "") {
            emptyCart();
        } else if (booking.val() !== undefined && priceId !== undefined && persons > 0) {
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

    $("#button-giftcard").click(function () {
        const giftcard = $("#giftcard");
        const amount = price();
        const helperText = $("#giftcard-helper-text");

        if ((giftcard.val() !== undefined || giftcard.val() !== "") && amount !== undefined) {
            $.ajax({
                method: "POST",
                url: "https://giftcard.schuepfenried.ch/api/giftcard/balance",
                data: {giftcard: giftcard.val(), amount: amount}
            }).done(function (result) {
                if (result.status === "sufficient" || result.status === "insufficient") {
                    $("#giftcard_uuid").val(giftcard.val());
                    updateGiftcard(result);
                } else if (result.status === "invalid") {
                    helperText.text("Der Gutschein ist ungültig");
                } else if (result.status === "inactive") {
                    helperText.text("Der Gutschein wurde noch nicht aktiviert");
                } else {
                    helperText.text("Es gab ein Problem mit dem Gutschein, bitte erneut versuchen oder beim Schüpfenried Team melden");
                }
            });
        } else if (giftcard.val() === undefined || giftcard.val() === "") {
            helperText.text("Bitte einen Gutscheincode eingeben");
        } else {
            helperText.text("Bitte zuerst einen Termin und die Anzahl Personen auswählen");
        }
    });

    function price() {
        const booking = $("form[name='cntnd_booking-reservation'] input[name='booking']:checked");
        const priceId = booking.data("price-id");
        const persons = $("#persons").val();
        if (priceId !== undefined && persons !== undefined) {
            return prices[priceId][persons];
        }
        return undefined;
    }

    function updateCart(booking, persons, priceId) {
        resetGiftcard();

        const date = moment(booking, "YYYYMMDDHHmm");
        const price = prices[priceId][persons];
        $("#cart_reservation_title").text("Reservation für " + persons + " Person(en) am " + date.format("DD.MM.YYYY HH:mm"));
        $("#cart_reservation_price").text(price + " CHF");
        $("#cart_total").text(price + " CHF");
    }

    function emptyCart() {
        resetGiftcard();

        $("#cart_reservation_title").text("Keine Buchung ausgewählt");
        $("#cart_reservation_price").text("");
        $("#cart_total").text("-");
    }

    function updateGiftcard(balance) {
        let amount = price();
        let remaining = amount;
        if (amount !== undefined) {
            if (balance.remaining !== 0) {
                remaining = balance.remaining;
                amount = amount - remaining;
            }
            else {
                amount = 0;
            }
        } else {
            remaining = 0;
            amount = "n/a";
        }
        $("#cart_giftcard_title").text("Gutschein");
        $("#cart_giftcard_price").text("-" + amount + " CHF");
        $("#cart_total").text(remaining + " CHF");

        $("#giftcard").prop("disabled", true);
        $("#button-giftcard").prop("disabled", true);
    }

    function resetGiftcard() {
        $("#giftcard_uuid").val("");
        $("#cart_giftcard_title").text("Kein Gutschein");
        $("#cart_giftcard_price").text("");
        $("#cart_total").text("-");

        $("#giftcard").prop("disabled", false);
        $("#button-giftcard").prop("disabled", false);
    }