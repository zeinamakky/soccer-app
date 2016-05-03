class Api::V1::PubsController < ApplicationController
  def index
    @pubs = Pub.all
    render 'index.json.jbuilder'
  end
end
