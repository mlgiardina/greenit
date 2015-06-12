class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :comment, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :link, index: true, foreign_key: true
      t.integer :upvotes, default: 0
      t.integer :downvotes, default: 0

      t.timestamps null: false
    end
  end
end
