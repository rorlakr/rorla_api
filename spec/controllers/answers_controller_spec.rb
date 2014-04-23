require 'spec_helper'

describe AnswersController do

  let(:question) { create(:question) }
  let(:answer) { create(:answer, question: question) }
  let(:valid_attributes) { attributes_for(:answer) } 
  let(:invalid_attributes) { attributes_for(:answer, content: nil) }

  describe 'GET #index' do
    it "> 요청한 Question과 연결된 모든 Answer로 instance 변수를 할당한다." do
      answers = [answer, create(:answer, question: question)]
      get :index, question_id: question.id
      expect(assigns(:question)).to eq(question)
      expect(assigns(:answers)).to match_array(answers)
    end
  end

  describe 'GET #show' do
    it "> 요청한 Question과 Answer로 instance 변수를 할당한다." do
      get :show, question_id: question.id, id: answer
      expect(assigns(:question)).to eq(question)
      expect(assigns(:answer)).to eq answer
    end
  end

  describe 'POST #create' do
    context "1) params가 유효할 때" do
      def do_post
        post :create, question_id: question.id, answer: valid_attributes
      end

      it "> 새로운 Answer를 생성한다." do
        expect{
          do_post
        }.to change(question.answers, :count).by(1)
      end

      it "> 요청한 Question과 새로운 Answer로 instance 변수를 할당한다." do
        do_post
        expect(assigns(:question)).to eq(question)
        expect(assigns(:answer)).to be_a(Answer)
        expect(assigns(:answer)).to_not be_new_record
      end
    end

    context "2) params가 유효하지 않을 때" do
      def do_post
        post :create, question_id: question.id, answer: invalid_attributes
      end

      it "> 새로운 Answer를 생성하지 않는다." do
        expect{
          do_post
        }.to_not change(Answer, :count)
      end

      it "> 요청한 Question과 생성하지 못한 Answer로 instance 변수를 할당한다." do
        do_post
        expect(assigns(:question)).to eq(question)
        expect(assigns(:answer)).to be_a(Answer)
        expect(assigns(:answer)).to be_new_record
      end
    end
  end

  describe 'PATCH #update' do
    context "1) params가 유효할 때" do
      def do_patch
        patch :update, question_id: question.id, id: answer,
          answer: attributes_for(:answer, content: "Answer content changed")
      end

      it "> 요청한 Answer를 업데이트한다." do
        do_patch
        answer.reload
        expect(answer.content).to eq "Answer content changed"
      end
      
      it "> 요청한 Question과 Answer로 instance 변수를 할당한다." do
        do_patch
        answer.reload
        expect(assigns(:question)).to eq(question)
        expect(assigns(:answer)).to eq answer
      end
    end

    context "2) params가 유효하지 않을 때" do
      def do_patch
        patch :update, question_id: question.id, id: answer, answer: invalid_attributes
      end

      it "> 요청한 answer를 업데이트하지 않는다." do
        do_patch
        answer.reload
        expect(answer.content).to eq "Answer Content"
      end

      it "> 요청한 Question과 Answer로 instance 변수를 할당한다." do
        do_patch
        answer.reload
        expect(assigns(:question)).to eq(question)
        expect(assigns(:answer)).to eq answer
      end
    end
  end

  describe 'DELETE #destroy' do
    before(:each) do
      @answer = create(:answer, question: question)
    end

    def do_delete
      delete :destroy, question_id: question.id, id: @answer
    end

    it "> 요청한 answer를 삭제한다." do
      expect {
        do_delete
      }.to change(Answer, :count).by(-1)
    end

    it "> 요청한 Question과 삭제된 Answer로 instance 변수를 할당한다." do
      do_delete
      expect(assigns(:question)).to eq(question)
      expect(assigns(:answer)).to eq(@answer)
    end
  end

end
