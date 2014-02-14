# == Schema Information
#
# Table name: auth_tokens
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  token      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe AuthToken do
  it "> user_id와 token 값이 유효하면 하나의 token이 생성된다." do
    token = AuthToken.create!(user_id: 1, token: "asdfasdfasdfasdfasdf")
    expect(token).to be_a(AuthToken)
    expect(token).to_not be_new_record
  end

  it "> user_id가 없으면 유효하지 않다." do
    token = AuthToken.new(user_id: nil, token: "asdfasdfasdfasdfasdf")
    expect(token).to be_invalid
  end

  it "> token이 없으면 유효하지 않다." do
    token = AuthToken.new(user_id: 1, token: nil)
    expect(token).to be_invalid
  end
end
