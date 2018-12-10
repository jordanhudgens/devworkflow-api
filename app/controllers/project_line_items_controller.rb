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

  def show
    render json: @project_line_item
  end

  private

    def set_project_line_item
      @project_line_item = ProjectLineItem.find(params[:id])
    end

    def project_line_item_params
      params.require(:project_line_item).permit(
        :title,
        :description,
        :completed,
        check_list_items_attributes: [
          :id,
          :title,
          :completed,
          :user_id
        ],
        item_images_raw: []
      )
    end
end
