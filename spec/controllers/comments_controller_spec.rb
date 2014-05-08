require 'spec_helper'

describe CommentsController do

  let(:post_create) { create(:post) }
  #let(:comment) {  create(:comment_to_post, commentable: post_create)  }
  let(:comment) {  create(:comment, commentable: post_create)  }
  let(:valid_attributes) { attributes_for(:comment) }
  let(:invalid_attributes) { attributes_for(:comment, content: nil) }

  describe "GET #index" do
    it "> 모든 Comment들을 @comments에 할당한다." do
      #comments = [comment, create(:comment_to_post, commentable: post_create)]
      comments = [comment, create(:comment, commentable: post_create)]
      get :index
      expect(assigns(:comments)).to match_array eq(comments)
    end
  end

  describe "GET #show" do
    it "> 요청한 Comment로 instance 변수를 할당한다." do
 
#       get :show, post_id: post.id, id: comment
     get :show, post_create_id: post_create.id, id: comment
      expect(assigns(:post)).to eq(post)
      expect(assigns(:comment)).to eq comment
    end 
  end

  describe "POST #create" do
    context "1) params가 유효할 때" do
      def do_post
        post :create, comment: valid_attributes
      end

      it "> 새로운 Comment를 생성한다." do
        expect {
          do_post
        }.to change(Comment, :count).by(1)
      end

      it "> Comment instance 변수를 할당한다." do
        do_post
        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to_not be_new_record
      end
    end

    context "2) params가 유효하지 않을 때" do
      def do_post
        post :create, comment: invalid_attributes
      end

      it "> 새로운 Comment를 생성하지 않는다." do
        expect{
          do_post
        }.to_not change(Comment, :count)
      end

      it "> 생성하지 못한 Comment로 instance 변수를 할당한다." do
        do_post
        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to be_new_record
      end
    end

  end

  describe 'PATCH #update' do
    context "1) params가 유효할 때" do
      def do_patch
        patch :update, post_id: post.id, id: comment,
          comment: attributes_for(:comment, content: "Answer content changed")
      end

      it "> 요청한 Comment를 업데이트한다." do
        do_patch
        comment.reload
        expect(comment.content).to eq "Answer content changed"
      end
      
      it "> 요청한 Post와 Comment로 instance 변수를 할당한다." do
        do_patch
        comment.reload
        expect(assigns(:post)).to eq(post)
        expect(assigns(:comment)).to eq comment
      end
    end

    context "2) params가 유효하지 않을 때" do
      def do_patch
        patch :update, post_id: post.id, id: comment, comment: invalid_attributes
      end

      it "> 요청한 Comment를 업데이트하지 않는다." do
        do_patch
        comment.reload
        expect(comment.content).to eq "abc edf"
      end

      it "> 요청한 Post와 Comment로 instance 변수를 할당한다." do
        do_patch
        comment.reload
        expect(assigns(:post)).to eq(post)
        expect(assigns(:comment)).to eq comment
      end
    end
  end

  describe 'DELETE #destroy' do
    before(:each) do
      @comment = create(:comment, commentable: post)
    end

    def do_delete
      delete :destroy, post_id: post.id, id: @comment
    end

    it "> 요청한 Comment를 삭제한다." do
      expect {
        do_delete
      }.to change(Comment, :count).by(-1)
    end

    it "> 요청한 Post와 삭제된 Comment로 instance 변수를 할당한다." do
      do_delete
      expect(assigns(:post)).to eq(post)
      expect(assigns(:comment)).to eq(@comment)
    end
  end

end
