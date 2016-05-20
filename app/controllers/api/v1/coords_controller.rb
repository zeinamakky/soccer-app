class Api::V1::CoordsController < ApplicationController

  def fetch_search_coords
    render json: session[:last_search]
  end

end
