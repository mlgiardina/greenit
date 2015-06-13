class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :votes
  has_many :downvotes
  has_many :comments
end
