module ApplicationHelper
  def current_path?(path)
    current_path = request.path
    return true if path == current_path

    false
  end
end
