class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :projects, :string
    add_column :users, :about, :string
    add_column :users, :experience, :string
    add_column :users, :skills, :string
    add_column :users, :portfolio, :string
  end
end
