class ProjectsController < ApplicationController
  include AuthenticationConcern

  def index
    @projects = @current_user.projects.active.sort_by_last_updated
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

  def destroy
    @project = Project.find(params[:id])

    if @project.user_id == @current_user.id
      @devo.destroy
    else
      render json: { status: 401 }
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
