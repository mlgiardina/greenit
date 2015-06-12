class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.belongs_to :board, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.text :body

      t.timestamps null: false
    end
  end
end
