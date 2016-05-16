class Api::V1::UserAllegiancesController < ApplicationController
  def index
    @user_allegiances = UserAllegiance.all
    render 'index.json.jbuilder'
  end
  
  def create
    @user_allegiance = UserAllegiance.create(
      user_id: params[:user_id],
      team_id: params[:team_id]

    )
    render 'show.json.jbuilder'
  end
end
