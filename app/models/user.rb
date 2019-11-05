# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord

  def bookmarks
    return Bookmark.where( {:user_id => self.id} )
  end

  def bookmarked_dishes
    array_of_dish_ids = self.bookmarks.pluck(:dish_id)

    return Dish.where( {:id => array_of_dish_ids} ).distinct
  end

  def bookmarked_venues
    array_of_venue_ids = self.bookmarks.pluck(:venue_id)

    return Venue.where( {:id => array_of_venue_ids} ).distinct
  end

  def bookmarked_neighborhoods
    array_of_neighborhood_ids = self.bookmarked_venues.pluck(:neighborhood_id)

    return Neighborhood.where( {:id => array_of_neighborhood_ids} ).distinct
  end

end
