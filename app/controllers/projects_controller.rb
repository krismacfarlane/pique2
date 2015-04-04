class ProjectsController < ApplicationController
  belongs_to_many :users

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end
end
