class RemoveUserFromBlogs < ActiveRecord::Migration
  def up
    add_column :blogs, :user_id, :integer
  end

  def down
    remove_column :blogs, :user_id
  end
end
