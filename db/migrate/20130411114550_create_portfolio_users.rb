class CreatePortfolioUsers < ActiveRecord::Migration
  def change
    create_table :portfolio_users do |t|
      t.integer :portfolio_id
      t.integer :user_id
    end
  end
end
