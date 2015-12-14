class MoodsController < ApplicationController

  # all moods for all users
  def index
    @moods = Mood.all
  end

  # one user's moods
  def show
    @user = current_user
    @user_moods = @user.moods
  end

  # form - create mood
  def new
    @mood = Mood.new
  end

  # new mood
  def create
    @mood = Mood.new(mood_params)
    @mood.user_id = current_user.id
    if @mood.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  # # form - edit mood
  # def edit
  #
  # end
  #
  # # edit mood
  # def update
  #
  # end

  # delete mood
  def destroy
    @mood = Mood.find(params[:id])
    @mood.destroy
    redirect_to user_path(current_user)
  end

  private
  def mood_params
    params.require(:mood).permit(
      :hot,
      :warm,
      :cold
    )
  end

end
