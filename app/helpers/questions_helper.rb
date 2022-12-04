module QuestionsHelper
  def question_header(test, action)
    if action == 'create'
      "Создать новый вопрос в тесте #{test.title}"
    elsif action == 'edit'
      "Редактировать новый вопрос в тесте #{test.title}"
    end
  end

  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end
