class GistQuestionService
  # ACCESS_TOKEN = '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'

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
  end

  private

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
