class ProjectsController < ApplicationController
  include AuthenticationConcern

  def index
    @projects = @current_user.projects.active.sort_by_last_updated
    render json: @projects, include: 'id,main_objective,project_line_items,status,title,updated_at,user'
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
      @project.destroy
    else
      render json: { status: 401 }
    end
  end

  def update
    @project = Project.find(params[:id])

    if @project.user_id == @current_user.id
      if @project.update(project_params)
        render json: @project
      else
        render json: @project.errors, status: :unprocessable_entity
      end
    else
      render json: { status: 401 }
    end
  end

  private

    def project_params
      params.require(:project).permit(
        :title,
        :main_objective,
        :status
      )
    end
end
