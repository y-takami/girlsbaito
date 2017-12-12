module ApplicationHelper

  def document_title
    if @title.present?
      "#{@title}-#{@site_name}"
    else
      '@site_name'
    end
  end



end
