class Bulletin < ActiveRecord::Base
  has_many :posts

  validates_length_of :title, maximum: 64
  validates_uniqueness_of :title
end
