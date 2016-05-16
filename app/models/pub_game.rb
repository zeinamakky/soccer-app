class PubGame < ActiveRecord::Base
  belongs_to :pub
  belongs_to :game
  belongs_to :team
end
