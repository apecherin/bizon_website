class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :id
      t.string :title
      t.text :desc
      t.string :avatar

      t.timestamps
    end
  end
end
