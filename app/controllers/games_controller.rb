class GamesController < ApplicationController
  def index
    if current_pub_user
      @pubs = current_pub_user.pubs
    end
    @teams = Team.all
   
 
  end

  def show
  end
end
