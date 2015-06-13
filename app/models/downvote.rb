class Downvote < ActiveRecord::Base
  belongs_to :link
  belongs_to :user
  belongs_to :comment
end
