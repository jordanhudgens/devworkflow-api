class ArchivedProjectsController < ApplicationController
  include AuthenticationConcern

  def index
    @projects = @current_user.projects.archived.sort_by_last_updated
    render json: @projects, status: :ok
  end

  def update
    if @project.user_id == @current_user.id
      @project = Project.find(params[:id])

      if @project.archived!
        render json: @project
      else
        render json: @project.errors, status: :unprocessable_entity
      end
    else
      render json: { status: 401 }
    end
  end
end
