class Api::V1::PubsController < ApplicationController
  def index
    if current_pub_user
      @pubs = Pub.where(pub_user_id: current_pub_user.id)
    else 
      @pubs = Pub.all
    end
    render 'index.json.jbuilder'
  end
  
end
