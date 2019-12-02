import "bootstrap";
import flatpickr from "flatpickr";
import { loadDynamicBannerText } from '../components/banner';
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout
import { initMapbox } from '../plugins/init_mapbox.js';
import { autocompleteSearch } from '../components/autocomplete';

autocompleteSearch();

initMapbox();

// date picker

const datePickers = document.querySelectorAll('.flatpickr-input')

datePickers.forEach(element => {
  flatpickr(element, {
    disableMobile: "true",
    altInput: true,
    altFormat: "F j, Y",
    dateFormat: "Y-m-d",
    minDate: "today",
  });
});


// profile page

$(function() {
  $('.toggle-btn').click(function() {
    $('.filter-btn').toggleClass('open');

  });

  $('.filter-btn a').click(function() {
    $('.filter-btn').removeClass('open');

  });

});

const x = document.getElementsByClassName("menus")

if (document.body.classList.contains("users-show")) {
  document.getElementById("one").addEventListener ("click", displayFavs);
  document.getElementById("two").addEventListener ("click", displayBookings);
  document.getElementById("three").addEventListener ("click", displayCards);
  document.getElementById("all").addEventListener ("click", displayProfile);
}



function displayFavs() {
  var i;
  var x = document.getElementsByClassName("menus");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  document.getElementById("favs").style.display = "block";
}

function displayBookings() {
  var i;
  var x = document.getElementsByClassName("menus");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  document.getElementById("bookings").style.display = "block";
}

function displayCards() {
  var i;
  var x = document.getElementsByClassName("menus");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  document.getElementById("cards").style.display = "block";
}

function displayProfile() {
  var i;
  var x = document.getElementsByClassName("menus");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  document.getElementById("profile").style.display = "block";
}

// loadDynamicBannerText();





