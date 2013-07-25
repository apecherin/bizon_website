class AddPathColumnToProduct < ActiveRecord::Migration
  def change
    add_column :products, :path, :string
  end
end
