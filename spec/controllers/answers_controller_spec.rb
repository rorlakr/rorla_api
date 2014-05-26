require 'spec_helper'

describe AnswersController do

  let(:question) { create(:question) }
  let(:answer) { create(:answer, question: question) }
  let(:valid_attributes) { attributes_for(:answer) } 
  let(:invalid_attributes) { attributes_for(:answer, content: nil) }

  describe 'User 로그인' do
    context "> 로그인 상태" do
      before :each do
        current_user = create(:user)
        current_user.confirm!
        sign_in current_user
      end

      describe 'GET #index' do
        it "> 요청한 Question과 연결된 모든 Answer로 instance 변수를 할당한다." do
          answers = [answer, create(:answer, question: question)]
          do_index
          expect(assigns(:question)).to eq(question)
          expect(assigns(:answers)).to match_array(answers)
        end
      end

      describe 'GET #show' do
        it "> 요청한 Question과 Answer로 instance 변수를 할당한다." do
          do_show
          expect(assigns(:question)).to eq(question)
          expect(assigns(:answer)).to eq answer
        end
      end

      describe 'POST #create' do
        context "1) params가 유효할 때" do
          it "> 새로운 Answer를 생성한다." do
            expect{
              do_post valid_attributes
            }.to change(question.answers, :count).by(1)
          end

          it "> 요청한 Question과 새로운 Answer로 instance 변수를 할당한다." do
            do_post valid_attributes
            expect(assigns(:question)).to eq(question)
            expect(assigns(:answer)).to be_a(Answer)
            expect(assigns(:answer)).to_not be_new_record
          end
        end

        context "2) params가 유효하지 않을 때" do
          it "> 새로운 Answer를 생성하지 않는다." do
            expect{
              do_post invalid_attributes
            }.to_not change(Answer, :count)
          end

          it "> 요청한 Question과 생성하지 못한 Answer로 instance 변수를 할당한다." do
            do_post invalid_attributes
            expect(assigns(:question)).to eq(question)
            expect(assigns(:answer)).to be_a(Answer)
            expect(assigns(:answer)).to be_new_record
          end
        end
      end

      describe 'PATCH #update' do
        context "1) params가 유효할 때" do
          it "> 요청한 Answer를 업데이트한다." do
            do_patch attributes_for(:answer, content: "Answer content changed")
            expect(answer.content).to eq "Answer content changed"
          end
          
          it "> 요청한 Question과 Answer로 instance 변수를 할당한다." do
            do_patch attributes_for(:answer, content: "Answer content changed")
            expect(assigns(:question)).to eq(question)
            expect(assigns(:answer)).to eq answer
          end
        end

        context "2) params가 유효하지 않을 때" do
          it "> 요청한 answer를 업데이트하지 않는다." do
            do_patch invalid_attributes
            expect(answer.content).to eq "Answer Content"
          end

          it "> 요청한 Question과 Answer로 instance 변수를 할당한다." do
            do_patch invalid_attributes
            expect(assigns(:question)).to eq(question)
            expect(assigns(:answer)).to eq answer
          end
        end
      end

      describe 'DELETE #destroy' do
        before(:each) do
          answer
        end

        it "> 요청한 answer를 삭제한다." do
          expect {
            do_delete
          }.to change(Answer, :count).by(-1)
        end

        it "> 요청한 Question과 삭제된 Answer로 instance 변수를 할당한다." do
          do_delete
          expect(assigns(:question)).to eq(question)
          expect(assigns(:answer)).to eq(answer)
        end
      end
    end

    context "> 비로그인 상태" do
      describe 'GET #index' do
        it "> 상태 코드 401(권한 없음)을 할당한다." do
          do_index
          expect(response.status).to be 401
        end
      end

      describe 'GET #show' do
        it "> 상태 코드 401(권한 없음)을 할당한다." do
          do_show
          expect(response.status).to be 401
        end
      end

      describe 'POST #create' do
        it "> 상태 코드 401(권한 없음)을 할당한다." do
          do_post valid_attributes
          expect(response.status).to be 401
        end
      end

      describe 'PATCH #update' do
        it "> 상태 코드 401(권한 없음)을 할당한다." do
          do_patch valid_attributes
          expect(response.status).to be 401
        end
      end

      describe 'DELETE #destroy' do
        it "> 상태 코드 401(권한 없음)을 할당한다." do
          do_delete
          expect(response.status).to be 401
        end
      end
    end
  end



  private

  def do_index
    get :index, question_id: question.id, format: :json
  end

  def do_show
    get :show, question_id: question.id, id: answer, format: :json
  end

  def do_post(attributes={})
    post :create, question_id: question.id, answer: attributes, format: :json
  end

  def do_patch(attributes={})
    patch :update, question_id: question.id, id: answer,
      answer: attributes, format: :json
    answer.reload
  end

  def do_delete
    delete :destroy, question_id: question.id, id: answer, format: :json
  end

end
