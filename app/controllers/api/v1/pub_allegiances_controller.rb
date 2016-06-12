class Api::V1::PubAllegiancesController < ApplicationController
  def index
    @pub_allegiances = Allegiance.all
    render 'index.json.jbuilder'
  end

  def create
    @pub_allegiance = Allegiance.create(
      pub_id: params[:pub_id],
      team_id: params[:team_id]
    )   
    render 'show.json.jbuilder'
  end
end
