class ChallengesController < ApplicationController
  def index
    @challenges = if params[:q]
                      Challenge.order(id: :desc).limit(10).where("title like '%#{params[:q]}%'")
                    else
                      Challenge.order(id: :desc).limit(10)
                    end
  end

  def show
    @challenge = Challenge.find params[:id]
    @support = @challenge.supports.new
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new challenge_params
    if @challenge.save
      flash.notice = "Reto creado correctamente"
      redirect_to challenge_path(@challenge)
    else
      render 'new'
    end
  end

  def edit
    @challenge = Challenge.find params[:id]
  end

  def update
    @challenge = Challenge.find params[:id]
    if @challenge.update_attributes(challenge_params)
      flash.notice = "Reto actualizado correctamente"
      redirect_to challenge_path(@challenge)
    else
      render 'edit'
    end
  end

  private

  def challenge_params
    params.require(:challenge).permit(:title, :body)
  end

end
