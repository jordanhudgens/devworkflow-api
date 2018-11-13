class CheckListItemsController < ApplicationController
  include AuthenticationConcern

  def create
    @check_list_item = CheckListItem.new(check_list_item_params)

    if @current_user
      @check_list_item.user_id = @current_user.id
    end

    if @check_list_item.save
      render json: @check_list_item, status: :created
    else
      render :new
    end
  end

  private

    def check_list_item_params
      params.require(:check_list_item).permit(
        :title,
        :completed,
        :project_line_item_id
      )
    end
end
