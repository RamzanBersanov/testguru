class GistQuestionService
  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
  end

  def gist_params
    {
      description: "#{I18n.t('.gist_description', test_title: @test.title)}",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      },
      public: true
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
