class AddIndexToPosts < ActiveRecord::Migration[6.0]
  def change
    add_index :posts, :text, length: 255
    add_index :posts, :title
  end
end
