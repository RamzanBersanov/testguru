# frozen_string_literal: true

class GistQuestionService
  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  Response = Struct.new(:success?, :html_url)

  def call
    result = @client.create_gist(gist_params)
    Response.new(result.present?, result.html_url)
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
  end

  def gist_params
    {
      description: I18n.t('.gist_description', test_title: @test.title).to_s,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      },
      public: true
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
