# == Schema Information
#
# Table name: venues
#
#  id              :integer          not null, primary key
#  address         :string
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  neighborhood_id :integer
#

class Venue < ApplicationRecord

  def bookmarks
    return Bookmark.where( {:venue_id => self.id} )
  end

  def neighborhood
    return Neighborhood.where( {:id => self.neighborhood_id} ).at(0)
  end

  def specialties
    array_of_dish_ids = self.bookmarks.pluck(:dish_id)

    return Dish.where( {:id => array_of_dish_ids} ).distinct
  end

  def fans
    array_of_user_ids = self.bookmarks.pluck(:user_id)

    return User.where( {:id => array_of_user_ids} ).distinct
  end

end
