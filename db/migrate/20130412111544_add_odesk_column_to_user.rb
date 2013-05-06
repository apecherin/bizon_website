class AddOdeskColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :odesk_link, :string
  end
end
