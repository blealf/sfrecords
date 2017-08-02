module ApplicationHelper
	def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "desc") ? "asc" : "desc"
    link_to title, {:sort => column, :direction => direction, :period => params[:period]}, {:class => css_class}
  end

  # def authorize!
  #   unless User.find_by(id: session[:user_id])
  #     redirect_to login_url, notice: "Please log in"
  #   end
  # end


  # def sortable(column, title = nil)
  #   title ||= column.titleize
  #   css_class = column == sort_column ? "current #{sort_direction}" : nil
  #   direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  #   link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  # end



  # def show_currency(value)
  # 	return Concurrency.convert(value, "USD", current_user.unit)
  # end

  # def save_currency(value, convert_from, converrt_to)
  # 	return Concurrency.convert(value, convert_from, convert_to)
  # end


end