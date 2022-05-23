class RootHandlerController < ApplicationController
  def index
    if current_user
      redirect_to categories_index_path
    else
      redirect_to splash_screen_index_path
    end
  end
end
