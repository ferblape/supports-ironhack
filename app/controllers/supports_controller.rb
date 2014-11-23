class SupportsController < ApplicationController
  def create
    @challenge = Challenge.find params[:challenge_id]
    @support = @challenge.supports.new challenge_params
    if @support.save
      UserMailer.new_support(@challenge, @support).deliver

      redirect_to challenge_path(@challenge), notice: 'Gracias por tu apoyo'
    else
      render 'challenges/show'
    end
  end

  private

  def challenge_params
    params.require(:support).permit(:email)
  end
end
