module ApplicationHelper
  def title
    base_title = "TMLS Intranet"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end


end
