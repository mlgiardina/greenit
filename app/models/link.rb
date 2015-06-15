class Link < ActiveRecord::Base
  belongs_to :board
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes
  has_many :downvotes
end
