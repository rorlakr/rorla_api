# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

require 'spec_helper'

describe User do
  describe "> User모델 객체의 생성" do
    it "> 유효한 데이터로 생성한 user 객체는 유효하다." do
      user = build(:user, password: "password")
      expect(user).to be_valid
    end
      
    it "> 대소문자 구별없이 이메일이 같은 경우 유효하지 않다 " do
      User.create(email: "user1@gmail.com", password: "password")
      user = User.new(email: "User1@gmail.com", password: "password")
      expect(user).to_not be_valid
    end

    it "> 비밀번호 길이가 8자리보다 짧을경우 유효하지 않다." do
      user = build(:user, password: "1234567")      
      expect(user).to_not be_valid
    end

    it "> 비밀번호 길이가 128자리보다 길경우 유효하지 않다." do
      user = build(:user, password: '1'*129)            
      expect(user).to_not be_valid
    end

    it "> email의 중복이 유효하지 않다." do
      create(:user, email: 'tester@example.com')
      tester = build(:user, email: "tester@example.com")
      expect(tester).to have(1).errors_on(:email)
    end

    it "> 공백 구분없이 이메일이 같은 경우는 유효하지 않다." do
      create(:user, email: "user1@gmail.com", password: "password")
      user = build(:user, email:"u ser 1@gmail.com", password: "password")
      expect(user).to_not be_valid
    end

  end
  describe "> User모델 유효성 검증" do
    it "> email이 없으면 유효하지 않다." do
      user = build(:user, email: nil)
      expect(user).to_not be_valid
    end
    
    it "> password가 없으면 유효하지 않다." do
      user = build(:user, password: nil)      
      expect(user).to_not be_valid
    end
  end
end
