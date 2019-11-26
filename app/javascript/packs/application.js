import "bootstrap";



 const imgBtn = document.querySelector('.img__btn')

 if(imgBtn !== null) {
   imgBtn.addEventListener("click", (event) => {
     console.log(event.currentTarget);
     document.querySelector('.cont').classList.toggle('s--signup');
   });
};


