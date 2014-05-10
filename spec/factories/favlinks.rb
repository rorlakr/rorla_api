# == Schema Information
#
# Table name: favlinks
#
#  id            :integer          not null, primary key
#  title         :string(255)      not null
#  description   :text
#  linkurl       :string(255)      not null
#  writer_id     :integer
#  shared        :boolean          default(TRUE)
#  bundlelink_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :favlink do
    title "MyString"
    description "MyText"
    linkurl "http:/a/aaa.com/ssss/asdfasdf"
    writer
    factory :favlink_not_shared do
      shared false
    end
    factory :favlink_bundled do
      bundlelink
    end
  end
end
