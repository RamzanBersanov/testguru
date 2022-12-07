module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "Создать новый вопрос в тесте #{question.test.title}"
    else
      "Редактировать вопрос в тесте #{question.test.title}"
    end
  end

  def current_year
    Time.current.year
  end

  def github_url(name, author, repo)
    link_to name, "https://github.com/#{author}/#{repo}".html_safe, target: "_blank", rel: "nofollow", rel: "nofollow"
  end

end
