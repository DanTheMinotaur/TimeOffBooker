/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import 'bulma'
import bulmaCalendar from 'bulma-calendar';
import "bulma-calendar/dist/css/bulma-calendar.min.css";

console.log('Hello World from Webpacker');

function ready(fn) {
    if (document.readyState != 'loading'){
        fn();
    } else {
        document.addEventListener('DOMContentLoaded', fn);
    }
}

ready(function() {
    let bookingButton = document.getElementById("bookTimeOff");

    const calendars = bulmaCalendar.attach(document.getElementById("bookingPicker"), {
        isRange: true
    });
    let bookingPicker = calendars[0];

    bookingPicker.on("select", function(datePicker) {
        let dateSelected = datePicker.data.value(); // TODO Figure out how to get end and start date seperately.
        console.log(dateSelected);
    });

    bookingButton.addEventListener("click", function () {
        bookingPicker.hide();
    });
});