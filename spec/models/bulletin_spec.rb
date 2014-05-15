require 'spec_helper'

describe Bulletin do

  describe "> 유효성 검증" do
    it { should have_many(:posts) }

    # it { should have_many(:posts).dependent(:destory) }

    describe "> 게시판 제목은" do

      it "너무 길면 안된다." do
        wrong_bulletin = build(:bulletin)
        wrong_bulletin.title = "공지사항" * 25
        wrong_bulletin.should_not be_valid
      end

      it "겹쳐서 만들 수 없다." do
        create(:bulletin)
        twin = build(:bulletin)
        twin.should_not be_valid
      end
    end
  end
end
