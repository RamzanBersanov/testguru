document.addEventListener('turbolinks:load', function() {

  const countDownDate = new Date ($('.timer').data('end-time')).getTime()

  console.log(countDownDate)

  if(countDownDate){

    let x = setInterval(function() {

    const now = new Date().getTime();

    let distance = countDownDate - now;

    let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    let seconds = Math.floor((distance % (1000 * 60)) / 1000);

    document.getElementById("result").innerHTML =  hours + "ч "
    + minutes + "м " + seconds + "с ";

    if (distance < 0) {
      clearInterval(x);
      document.getElementById("result").innerHTML = "Время истекло!";
      window.location = $('.path').data('result')
    }
  }, 1000);}


})
