class AddAttachesColumnToProduct < ActiveRecord::Migration
  def change
    add_column :products, :attachfree_file_name, :string
    add_column :products, :attachfree_content_type, :string
    add_column :products, :attachfree_file_size, :integer
    add_column :products, :attachfree_updated_at, :datetime
  end
end
