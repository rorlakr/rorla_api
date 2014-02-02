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
  pending "add some examples to (or delete) #{__FILE__}"
end
