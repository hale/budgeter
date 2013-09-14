module ApplicationHelper

  def current_tab
    params[:tab] || session[:tab]
  end

  def current_tab=(tab)
    params[:tab] =tab
  end

end
