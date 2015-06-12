class Vote < ActiveRecord::Base
  belongs_to :comment
  belongs_to :user
  belongs_to :link
end
