class Allegiance < ActiveRecord::Base
  belongs_to :pub
  belongs_to :team
end
