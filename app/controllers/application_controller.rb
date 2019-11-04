class ApplicationController < ActionController::Base

  # cuisines
  def list_cuisines
    answer = Cuisine.all

    render( {:plain => answer.to_json } )
  end

  # dishes
  def list_dishes
    answer = Dish.all

    render( {:plain => answer.to_json } )
  end

  def dish_details
    answer = Dish.where( {:id => params.fetch(:id)} ).at(0)

    render( {:plain => answer.to_json } )
  end

  def list_dish_bookmarks
    answer = "TODO: list_dish_bookmarks"

    render( {:plain => answer.to_json } )
  end

  #neighborhoods
  def list_neighborhoods
    answer = Neighborhood.all

    render( {:plain => answer.to_json } )
  end

  #venues
  def list_venues
    answer = Venue.all

    render( {:plain => answer.to_json } )
  end

  def venue_details
    answer = Venue.where( {:id => params.fetch(:id)} ).at(0)

    render( {:plain => answer.to_json } )
  end

  def list_venue_bookmarks
    answer = "TODO: list_venue_bookmarks"

    render( {:plain => answer.to_json } )
  end

  #users
  def list_users
    answer = User.all

    render( {:plain => answer.to_json } )
  end

  def user_details
    answer = User.where( {:id => params.fetch(:id)} ).at(0)

    render( {:plain => answer.to_json } )
  end

  def list_user_bookmarks
    answer = "TODO: list_user_bookmarks"

    render( {:plain => answer.to_json } )
  end

  #bookmark
  def add_bookmark
    answer = "TODO: add_bookmark"

    render( {:plain => answer.to_json } )
  end

  def remove_bookmark
    answer = "TODO: remove_bookmark"

    render( {:plain => answer.to_json } )
  end


end
