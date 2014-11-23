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

  def previous_page?
    if params[:page].blank? || params[:page].to_i == 1
      false
    else
      true
    end
  end

  def next_page?
    current_page = params[:page].to_i

    total = @challenges.except(:limit).except(:offset).count

    total_pages = (total.to_f/Challenge::PER_PAGE ).ceil

    current_page < total_pages
  end

  def previous_page
    previous_page = params[:page].to_i - 1

    if previous_page == 0
      1
    else
      previous_page
    end
  end

  def next_page
    params[:page].to_i + 1
  end

  private

  def flash_css_class
    flash[:notice].present? ? 'notice' : 'alert'
  end
end
