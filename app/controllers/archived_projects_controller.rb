class ArchivedProjectsController < ApplicationController
  include AuthenticationConcern

  def index
    @projects = @current_user.projects.archived.sort_by_last_updated
    render json: @projects, status: :ok
  end

  def create
    # @project = Project.new(project_params)
    # @project.user_id = @current_user.id
    #
    # if @project.save
    #   render json: @project, status: :created
    # else
    #   render :new
    # end
  end
end
