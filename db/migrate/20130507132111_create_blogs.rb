class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.integer :id
      t.string :title
      t.text :post
      t.integer :user

      t.timestamps
    end
  end
end
