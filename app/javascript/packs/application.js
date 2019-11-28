import "bootstrap";
import flatpickr from "flatpickr";
import { loadDynamicBannerText } from '../components/banner';
//algolia
// //= require algolia/v3/algoliasearch.min

// var client = algoliasearch('QA2I617SDK', '489de8ff26e9d9de8e00090a6ec33065');
// var index = client.initIndex('YourIndexName');
// index.search('something', { hitsPerPage: 10, page: 0 })
//   .then(function searchDone(content) {
//     console.log(content)
//   })
//   .catch(function searchFailure(err) {
//     console.error(err);
//   });

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


document.getElementById("one").addEventListener ("click", displayFavs);
document.getElementById("two").addEventListener ("click", displayBookings);
document.getElementById("three").addEventListener ("click", displayCards);
document.getElementById("all").addEventListener ("click", displayProfile);


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

loadDynamicBannerText();


//  const imgBtn = document.querySelector('.img__btn')

//  if(imgBtn !== null) {
//    imgBtn.addEventListener("click", (event) => {
//      console.log(event.currentTarget);
//      document.querySelector('.cont').classList.toggle('s--signup');
//    });
// };


