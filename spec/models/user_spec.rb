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
      expect(User.new(email: "user1@gmail.com", password: "password")).to be_valid
    end

    it "> email의 중복이 유효하지 않다." do
      user = User.create(
        email: 'tester@example.com',
        password: '12345678')
      another_user = User.new(
        email: 'tester@example.com',
        password: '12345678')
      expect(another_user).to have(1).errors_on(:email)
    end
  end
  describe "> User모델 유효성 검증" do
    it "> email이 없으면 유효하지 않다." do
      expect(User.new(email: nil, password: "password")).to_not be_valid
    end
    
    it "> password가 없으면 유효하지 않다." do
      expect(User.new(email: "user1@gmail.com", password: nil)).to_not be_valid
    end
  end
end
