class ProjectsController < ApplicationController
  include AuthenticationConcern

  def index
    @projects = @current_user.projects.active
    render json: @projects, status: :ok
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = @current_user.id

    if @project.save
      render json: @project, status: :created
    else
      render :new
    end
  end

  private

    def project_params
      params.require(:project).permit(
        :title,
        :main_objective,
      )
    end
end
