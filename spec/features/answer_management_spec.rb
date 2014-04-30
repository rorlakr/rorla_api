require 'spec_helper'

feature "Answer management" do
  include Capybara::Json

  let(:question) { create(:question, id: 37) }
  let(:user) { create(:user, id: 1004) }
  let(:datetime) { "2014-04-21T01:02:03.405+09:00" }

  before(:each) do
    Capybara.current_driver = :rack_test_json
    create(:answer, question: question, user: user,
                    id: 3701, content: "Answer 1",
                    created_at: datetime, updated_at: datetime)
    create(:answer, question: question, user: user,
                    id: 3702, content: "Answer 2",
                    created_at: datetime, updated_at: datetime)
    user.confirm!
    @header = { "X-Auth-Email" => user.email, "X-Auth-Token" => user.generate_auth_token! }
  end

  scenario "> 한 질문에 달린 답변 목록을 얻는다" do
    get "/questions/37/answers.json", nil, @header
    expect(json).to include({
      id: 3701,
      question_id: 37,
      user_id: 1004,
      content: "Answer 1",
      created_at: datetime,
      updated_at: datetime
    }.with_indifferent_access)
    expect(json).to include({
      id: 3702,
      question_id: 37,
      user_id: 1004,
      content: "Answer 2",
      created_at: datetime,
      updated_at: datetime
    }.with_indifferent_access)
  end

  scenario "> 한 답변의 상세 정보를 얻는다" do
    get "/questions/37/answers/3701.json", nil, @header
    expect(json).to include({
      id: 3701,
      question_id: 37,
      user_id: 1004,
      content: "Answer 1",
      created_at: datetime,
      updated_at: datetime
    }.with_indifferent_access)
  end

  scenario "> 질문에 대한 답변을 작성한다" do
    post "/questions/37/answers.json", {answer: {content: "Do It Yourself"}}, @header
    expect(json).to include({
      content: "Do It Yourself"
    }.with_indifferent_access)
  end

  scenario "> 답변을 수정한다" do
    put "/questions/37/answers/3701.json", {answer: {content: "Hacked"}}, @header
    expect(json).to include({
      content: "Hacked"
    }.with_indifferent_access)
  end

  scenario "> 답변을 삭제한다" do
    delete "/questions/37/answers/3701.json", nil, @header
    expect(json).to include({
      message: "destroyed"
    }.with_indifferent_access)
  end
end
