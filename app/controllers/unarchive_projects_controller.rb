class UnarchiveProjectsController < ApplicationController
  include AuthenticationConcern

  def update
    @project = Project.find(params[:id])

    if @project.user_id == @current_user.id
      if @project.active!
        render json: @project
      else
        render json: @project.errors, status: :unprocessable_entity
      end
    else
      render json: { status: 401 }
    end
  end
end
