# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end

    add_foreign_key :likes, :users, column: :user_id
    add_foreign_key :likes, :posts, column: :post_id
    add_index :likes, :user_id
    add_index :likes, :post_id
  end
end
