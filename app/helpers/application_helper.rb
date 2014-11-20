module ApplicationHelper
  def flash_message
    return if flash.empty?

    content_tag :div, class: "message #{flash_css_class}" do
      content_tag :p do
        flash[:notice] || flash[:alert]
      end
    end
  end

  def in_search?
    params[:q]
  end

  private

  def flash_css_class
    flash[:notice].present? ? 'notice' : 'alert'
  end
end
