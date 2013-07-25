class AddCustomerColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :customer, :string
  end
end
