class RemoveDownvotesFromVotes < ActiveRecord::Migration
  def change
    remove_column(:votes, :downvotes)
    remove_column(:votes, :upvotes)
  end
end
