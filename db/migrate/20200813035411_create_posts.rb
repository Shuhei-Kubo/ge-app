class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
    t.text :text,             null: false
    t.string :image
    t.string :title,          null: false
    t.references :user, foreign_key: true
    t.timestamps
    end
  end
end
