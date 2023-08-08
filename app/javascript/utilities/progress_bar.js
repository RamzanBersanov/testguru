document.addEventListener('turbolinks:load', function() {

    let questionNumber = $('.question-number').data('current')
    let questionsCount = $('.questions-count').data('all')
    let progressBar = $('.progress-bar')

    findProgressPercent(questionNumber, questionsCount)
})

function findProgressPercent(questionNumber, questionsCount) {
    let progressPercent = (questionNumber / questionsCount * 100).toFixed(1)
    styleProgressBar(progressPercent)
}

function styleProgressBar(progressPercent) {
    $('.progress-percent').css("width", progressPercent+'%').text(progressPercent+'%')
}


