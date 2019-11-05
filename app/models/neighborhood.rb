# == Schema Information
#
# Table name: neighborhoods
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Neighborhood < ApplicationRecord

  def venues
    return Venue.where( {:neighborhood_id => self.id} )
  end

  

end
