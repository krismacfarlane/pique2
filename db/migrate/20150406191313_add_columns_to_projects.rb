class AddColumnsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :about, :string
    add_column :projects, :team, :string
    add_column :projects, :openings, :string
    add_column :projects, :case_studies, :string
    add_column :projects, :case_studies2, :string
  end
end
