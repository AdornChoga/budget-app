module ApplicationHelper
  def current_path?(controller, action)
    return true if params[:controller] == controller and params[:action] == action

    false
  end
end
