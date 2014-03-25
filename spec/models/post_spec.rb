# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  title        :string(255)
#  content      :text
#  writer_id    :integer
#  published    :boolean          default(FALSE)
#  published_at :datetime
#  hit          :integer          default(0)
#  deleted_at   :datetime
#

require 'spec_helper'

describe Post do
  describe "> Post모델 객체의 생성" do
    it "> 유효한 데이터로 생성한 Post 객체는 유효하다." do
      expect(create(:post)).to be_valid
    end
  end
  describe "> 유효성 검증" do
    it "> Title이 없으면 유효하지 않다." do
      expect(build(:post)).to validate_presence_of :title
    end
    it "> Title이 3글자 이상 255글자 이하이어야 한다." do
      should ensure_length_of(:title).is_at_least(3).is_at_most(255)
    end
    it "> Content가 없으면 유효하지 않다." do
      expect(build(:post)).to validate_presence_of :content
    end
    it "> Content가 0글자 이상 10000글자 이하이어야 한다." do
      should ensure_length_of(:content).is_at_least(0).is_at_most(10000)
    end
    it "> Post 생성시 hit의 기본값은 0이다." do
      expect(build(:post).hit).to eq(0)
    end
    it "> published가 false일때 published_at은 nil이다." do
      post = create(:post, published: false)
      expect(post.published_at).to be_nil
    end
    it "> published가 true일때 published_at에 Time이 입력된다." do
      post = create(:post, published: true)
      expect(post.published_at).to be_a_kind_of(Time)
    end
  end
  describe "> 관계선언 검증" do
    it "> has_one :plaza, dependent: :destroy" do
      expect(create(:post)).to have_one(:plaza).dependent(:destroy)
    end
  end
end
