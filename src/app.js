import 'bulma'
import './scss/style.scss'
import 'daterangepicker'


(function () {
    let bookingButton = document.getElementById("book-time-off");
    console.log(bookingButton);
    bookingButton.daterangepicker();
})();