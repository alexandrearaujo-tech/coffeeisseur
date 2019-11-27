import "bootstrap";
import flatpickr from "flatpickr";


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


// profile

$(function() {
  $('.toggle-btn').click(function() {
    $('.filter-btn').toggleClass('open');

  });

  $('.filter-btn a').click(function() {
    $('.filter-btn').removeClass('open');

  });

});

$('#all').click(function() {

  $('ul.tasks li').slideDown(300);

});

$('#one').click(function() {
  $('.tasks li:not(.one)').slideUp(300, function() {
    $('.one').slideDown(300);

  });
});

$('#two').click(function() {
  $('.tasks li:not(.two)').slideUp(300, function() {
    $('.two').slideDown(300);

  });
});
$('#three').click(function() {
  $('.tasks li:not(.three)').slideUp(300, function() {
    $('.three').slideDown(300);

  });
});



//  const imgBtn = document.querySelector('.img__btn')

//  if(imgBtn !== null) {
//    imgBtn.addEventListener("click", (event) => {
//      console.log(event.currentTarget);
//      document.querySelector('.cont').classList.toggle('s--signup');
//    });
// };


