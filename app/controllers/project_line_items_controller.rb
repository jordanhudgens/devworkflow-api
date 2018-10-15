class ProjectLineItemsController < ApplicationController
  before_action :set_project_line_item

  include AuthenticationConcern

  def update
    if @project_line_item.update(project_line_item_params)
      render json: @project_line_item
    else
      render json: @project_line_item.errors, status: :unprocessable_entity
    end
  end

  private

    def set_project_line_item
      @project_line_item = ProjectLineItem.find(params[:id])
    end

    def project_line_item_params
      params.require(:project_line_item).permit(
        :title,
        :description,
        :status,
      )
    end
end
