require 'spec_helper'

describe UsersController do

  before :each do
    @current_user = User.create!(email:"admin@rorlab.org",password:"12345678")
  end

  let(:valid_attributes) { { email: "user1@rorlab.org", password: "password" } }

  let(:valid_session) do
    @current_user.confirm!
    sign_in @current_user
  end

  context "User모델 객체를 하나 생성한 상태" do

    before :each do
      @user = User.create! valid_attributes
    end

    describe "GET #index" do
      it "> 모든 사용자를 @users에 할당한다." do
        get :index, {}, valid_session
        expect(assigns(:users)).to eq(User.all)
      end
    end

    describe "GET #show" do
      it "> 요청한 사용자 정보를 @user에 할당한다." do
        get :show, {:id => @user.id}, valid_session
        expect(assigns(:user)).to eq @user
      end
    end

    describe "DELETE #destroy" do
      it "> 요청한 사용자를 삭제한다." do
        expect {
          delete :destroy, {:id => @user.id}, valid_session
        }.to change(User, :count).by(-1)
      end
    end

  end

  describe "POST #create" do
    describe "1) params가 유효할 때" do
      it "> 새로운 사용자를 생성한다." do
        expect {
          post :create, {:user => valid_attributes}, valid_session
        }.to change(User, :count).by(1)
      end

      it "> 새로운 사용자를 생성하여 @user에 할당한다." do
        post :create, {:user => valid_attributes}, valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to_not be_new_record
      end
    end

    describe "2) params가 유효하지 않을 때" do
      it "> 새로 생성되었지만 저장되지 않은 user 객체를 @user에 할당한다." do
        post :create, {:user => { email:nil, password:nil }}, valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_new_record
      end
    end
  end

end
