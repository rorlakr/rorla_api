require 'spec_helper'

describe PostsController do

  let(:post) { create(:post) }
  let(:valid_attributes) { attributes_for(:post) }
  let(:invalid_attributes) { attributes_for(:post, title: nil, content: nil) }

  describe 'GET #index' do
    it "> 모든 Post로 instance 변수를 할당한다." do
      posts = [post, create(:post)]
      get :index
      expect(assigns(:posts)).to match_array(posts)
    end
  end

  describe 'GET #show' do
    it "> 요청한 Post로 instance 변수를 할당한다." do
      get :show, id: post
      expect(assigns(:post)).to eq post
    end
  end

  describe 'POST #create' do
    context "1) params가 유효할 때" do
      it "> 새로운 Post를 생성한다." do
        expect {
          post :create, post: valid_attributes
        }.to change(Post, :count).by(1)
      end

      it "> 새로운 Post로 instance 변수를 할당한다." do
        post :create, post: valid_attributes
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to_not be_new_record
      end
    end

    context "2) params가 유효하지 않을 때" do
      it "> 새로운 Post를 생성하지 않는다." do
        expect {
          post :create, post: invalid_attributes
        }.to_not change(Post, :count)
      end

      it "> 새로운 Post를 instance 변수에 할당한다." do
        post :create, post: invalid_attributes
        expect(assigns(:post)).to be_a(Question)
        expect(assigns(:post)).to be_new_record
      end
    end
  end

  describe 'PATCH #update' do
    context "1) params가 유효할 때" do
      it "> 요청한 post를 업데이트한다." do
        patch :update, id: post, post: attributes_for(:post, title: "Wonderfulday isn't it?", content: "Yes!!!")
        post.reload
        expect(post.title).to eq("Wonderfulday isn't it?")
        expect(post.content).to eq("Yes!!!")
      end

      it "> 요청한 post를 instance 변수에 할당한다." do
        patch :update, id: post, post: valid_attributes
        post.reload
        expect(assigns(:post)).to eq post
      end
    end

    context "2) params가 유효하지 않을 때" do
      it "> 요청한 post를 업데이트하지 않는다." do
        patch :update, id: post, post: invalid_attributes
        post.reload
        expect(post.title).to eq("post title")
        expect(post.content).to eq("post content")
      end

      it "> 요청한 post를 instance 변수에 할당한다." do
        patch :update, id: post, post: invalid_attributes
        post.reload
        expect(assigns(:post)).to eq post
      end
    end
    
  end

  describe 'DELETE #destroy' do
    it "> 요청한 post를 삭제한다." do
      post
      expect {
        delete :destroy, id: post
      }.to change(Post, :count).by(-1)
    end
  end

end
