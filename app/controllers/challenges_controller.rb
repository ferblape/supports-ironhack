class ChallengesController < ApplicationController
  before_filter :load_challenge, except: [:index, :new]

  def index
    @challenges = Challenge.order(id: :desc).limit(10)

    if params[:q].present?
      q = "%#{params[:q]}%"
      @challenges = @challenges.where("title ilike ?", q)
    end
  end

  def show
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
  end

  def update
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

  def load_challenge
    @challenge = Challenge.find params[:id]
  end

end
