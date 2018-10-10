class ProjectsController < ApplicationController
  include AuthenticationConcern

  def index
    @projects = @current_user.projects.active
    render json: @projects, status: :ok
  end
end
