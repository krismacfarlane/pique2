class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.belongs_to :users, index: true
      t.string :name
      t.string :owner
      t.string :collaborators
      t.boolean :active
      t.integer :number_of_collaborators

      t.timestamps null: false
    end
    # add_foreign_key :projects, :users
  end
end
