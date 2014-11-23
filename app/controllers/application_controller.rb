class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :load_last_challenges

  private

  def load_last_challenges
    @last_challenges = Challenge.limit(3).order("created_at DESC")
  end

end
