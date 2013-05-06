class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :name
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
