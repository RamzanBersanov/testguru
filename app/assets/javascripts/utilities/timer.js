document.addEventListener('turbolinks:load', function() {

  const countDownDate = new Date ($('.timer').data('end-time')).getTime()

  console.log(countDownDate)

  if(countDownDate){

    var x = setInterval(function() {

    var now = new Date().getTime();

    var distance = countDownDate - now;

    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    document.getElementById("result").innerHTML =  hours + "ч "
    + minutes + "м " + seconds + "с ";

    if (distance < 0) {
      clearInterval(x);
      document.getElementById("result").innerHTML = "Время истекло!";
      window.location = $('.path').data('result')
    }
  }, 1000);}


})
