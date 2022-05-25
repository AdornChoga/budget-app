class RootHandlerController < ApplicationController
  def index
    if current_user
      redirect_to categories_path
    else
      redirect_to budget_app_path
    end
  end
end
