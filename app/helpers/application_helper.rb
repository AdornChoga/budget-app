module ApplicationHelper
  def no_navbar?
    paths = ['/budget_app']
    current_path = request.path
    return true if paths.include? current_path

    false
  end
end
