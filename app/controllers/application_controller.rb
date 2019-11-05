class ApplicationController < ActionController::Base

  # cuisines
  def list_cuisines
    answer = Cuisine.all

    render( {:plain => answer.to_json } )
  end

  # dishes
  def list_dishes

    cuisine_id = params.fetch(:cuisine_id, nil)
    if cuisine_id.nil?
      answer = Dish.all
    else
      c = Cuisine.where( {:id => cuisine_id} ).at(0)
      answer = c.dishes
    end

    render( {:plain => answer.to_json } )
  end

  def dish_details
    answer = Dish.where( {:id => params.fetch(:id)} ).at(0)

    render( {:plain => answer.to_json } )
  end

  def list_dish_bookmarks
    d = Dish.where( {:id => params.fetch(:id)} ).at(0)
    answer = d.bookmarks

    render( {:plain => answer.to_json } )
  end

  def dish_experts
    d = Dish.where( {:id => params.fetch(:id)} ).at(0)
    answer = d.experts

    render( {:plain => answer.to_json } )
  end

  #neighborhoods
  def list_neighborhoods
    answer = Neighborhood.all

    render( {:plain => answer.to_json } )
  end

  #venues
  def list_venues
    neighborhood_id = params.fetch(:neighborhood_id, nil)
    if neighborhood_id.nil?
      answer = Venue.all
    else
      n = Neighborhood.where( {:id => neighborhood_id} ).at(0)
      answer = n.venues
    end

    render( {:plain => answer.to_json } )
  end

  def venue_details
    answer = Venue.where( {:id => params.fetch(:id)} ).at(0)

    render( {:plain => answer.to_json } )
  end

  def list_venue_bookmarks
    v = Venue.where( {:id => params.fetch(:id)} ).at(0)
    answer = v.bookmarks

    render( {:plain => answer.to_json } )
  end

  def venue_specialties
    v = Venue.where( {:id => params.fetch(:id)} ).at(0)
    answer = v.specialties

    render( {:plain => answer.to_json } )
  end

  def venue_fans
    v = Venue.where( {:id => params.fetch(:id)} ).at(0)
    answer = v.fans

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
    u = User.where( {:id => params.fetch(:id)} ).at(0)

    dish_id = params.fetch(:dish_id,nil)
    if dish_id.nil?
      answer = u.bookmarks
    else
      answer = u.bookmarks.where( {:dish_id => dish_id} ).distinct
    end

    render( {:plain => answer.to_json } )
  end

  def list_user_bookmarked_dishes
    u = User.where( {:id => params.fetch(:id)} ).at(0)
    answer = u.bookmarked_dishes

    render( {:plain => answer.to_json } )
  end

  #bookmark
  def add_bookmark

    input_user_id = params.fetch(:input_user_id, nil)
    input_dish_id = params.fetch(:input_dish_id, nil)
    input_venue_id= params.fetch(:input_venue_id, nil)

    cb = Bookmark.count
    r = Bookmark.new
    r.dish_id  = input_dish_id
    r.venue_id = input_venue_id
    r.user_id  = input_user_id
    r.save
    ca = Bookmark.count

    answer = {:before_count => cb, :after_count => ca, :record_added => r}

    render( {:plain => answer.to_json } )
  end

  def remove_bookmark
    bookmark_id = params.fetch(:id, nil)

    cb = Bookmark.count
    r = Bookmark.where( {:id => bookmark_id}).at(0)

    if r.nil?
      ca = Bookmark.count
      answer = {:before_count => cb, :after_count => ca, :record_removed => "No record removed bookmark id "+bookmark_id.to_s+" is incorrect"}
    else
      r.destroy
      ca = Bookmark.count
      answer = {:before_count => cb, :after_count => ca, :record_removed => r}
    end

    render( {:plain => answer.to_json } )
  end


end
