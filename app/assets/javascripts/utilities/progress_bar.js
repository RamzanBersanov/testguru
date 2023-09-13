document.addEventListener('turbolinks:load', function() {

    const questionNumber = $('.question-number').data('current')
    const questionsCount = $('.questions-count').data('all')
    const progressBar = $('.progress-bar')

    findProgressPercent(questionNumber, questionsCount)
})

function findProgressPercent(questionNumber, questionsCount) {
    const progressPercent = (questionNumber / questionsCount * 100).toFixed(1)
    styleProgressBar(progressPercent)
}

function styleProgressBar(progressPercent) {
    $('.progress-percent').css("width", progressPercent+'%').text(progressPercent+'%')
}


