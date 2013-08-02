class AddAttaches1ColumnToProduct < ActiveRecord::Migration
  def change
    add_column :products, :attachcomm_file_name, :string
    add_column :products, :attachcomm_content_type, :string
    add_column :products, :attachcomm_file_size, :integer
    add_column :products, :attachcomm_updated_at, :datetime
  end
end
