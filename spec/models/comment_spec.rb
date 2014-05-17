# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  created_at       :datetime
#  updated_at       :datetime
#  content          :text
#  writer_id        :integer
#  commentable_id   :integer
#  commentable_type :string(255)
#

require 'spec_helper'

describe Comment do
  describe "> 모델 객체의 생성" do
    it "> 유효한 데이터로 생성한 Comment 객체는 유효하다." do
      expect(create(:comment)).to be_valid
    end
  end

  describe "> Association 검증" do
    it "> belongs_to :post" do
      post = create(:post)
      comment = create(:comment_to_post, commentable: post)
      expect(comment.commentable).to eq post
    end
    it "> belongs_to :question" do
      question = create(:question)
      comment = create(:comment_to_question, commentable: question)
      expect(comment.commentable).to eq question
    end
    it "> belongs_to :answer" do
      answer = create(:answer)
      comment = create(:comment_to_answer, commentable: answer)
      expect(comment.commentable).to eq answer
    end

  end

  describe "> 유효성 검증" do
    it "> Content가 없으면 유효하지 않다." do
      expect(build(:comment)).to validate_presence_of :content
    end
    it "> Content가 0글자 이상 10000글자 이하이어야 한다." do
      should ensure_length_of(:content).is_at_least(0).is_at_most(10000)
    end
  end

end

