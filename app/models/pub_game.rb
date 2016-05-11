class PubGame < ActiveRecord::Base
  belongs_to :pub
  belongs_to :game
end
