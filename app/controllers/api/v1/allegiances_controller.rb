class Api::V1::AllegiancesController < ApplicationController
  def index
    @allegiances = Allegiance.all
    render 'index.json.jbuilder'
  end

  def create
    @allegiance = Allegiance.create(
      pub_id: params[:pub_id],
      team_id: params[:team_id]
    )   
    render 'show.json.jbuilder'
  end
end
