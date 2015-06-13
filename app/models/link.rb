class Link < ActiveRecord::Base
  belongs_to :board
  belongs_to :user
  has_many :comments
  has_many :votes
end
