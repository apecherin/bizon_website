class AddDescriptionColumnToUser < ActiveRecord::Migration
  def change
    add_column :blogs, :avatar, :string
  end
end
