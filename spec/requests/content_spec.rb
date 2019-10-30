require "rails_helper"

describe "/cuisines" do
  it "has a list of all cuisines", :points => 2 do
    first_cuisine = Cuisine.new
    first_cuisine.name = "Cuisine #{rand(100)}"
    first_cuisine.save

    second_cuisine = Cuisine.new
    second_cuisine.name = "Cuisine #{rand(100)}"
    second_cuisine.save

    third_cuisine = Cuisine.new
    third_cuisine.name = "Cuisine #{rand(100)}"
    third_cuisine.save

    get "/cuisines"

    expect(response.body).to eq(Cuisine.all.to_json)
  end
end

describe "/dishes" do
  it "has a list of all dishes", :points => 2 do
    first_dish = Dish.new
    first_dish.name = "Dish #{rand(100)}"
    first_dish.save

    second_dish = Dish.new
    second_dish.name = "Dish #{rand(100)}"
    second_dish.save

    third_dish = Dish.new
    third_dish.name = "Dish #{rand(100)}"
    third_dish.save

    get "/dishes"

    expect(response.body).to eq(Dish.all.to_json)
  end
end

describe "/dishes/[ANY EXISTING DISH ID]" do
  it "has the details of one dish", :points => 2 do
    first_dish = Dish.new
    first_dish.name = "Dish #{rand(100)}"
    first_dish.save

    second_dish = Dish.new
    second_dish.name = "Dish #{rand(100)}"
    second_dish.save

    third_dish = Dish.new
    third_dish.name = "Dish #{rand(100)}"
    third_dish.save

    get "/dishes/#{second_dish.id}"

    expect(response.body).to eq(second_dish.to_json)
  end
end

describe "/neighborhoods" do
  it "has a list of all neighborhoods", :points => 2 do
    first_neighborhood = Neighborhood.new
    first_neighborhood.name = "Neighborhood #{rand(100)}"
    first_neighborhood.save

    second_neighborhood = Neighborhood.new
    second_neighborhood.name = "Neighborhood #{rand(100)}"
    second_neighborhood.save

    third_neighborhood = Neighborhood.new
    third_neighborhood.name = "Neighborhood #{rand(100)}"
    third_neighborhood.save

    get "/neighborhoods"

    expect(response.body).to eq(Neighborhood.all.to_json)
  end
end

describe "/venues" do
  it "has a list of all venues", :points => 2 do
    first_venue = Venue.new
    first_venue.name = "Venue #{rand(100)}"
    first_venue.save

    second_venue = Venue.new
    second_venue.name = "Venue #{rand(100)}"
    second_venue.save

    third_venue = Venue.new
    third_venue.name = "Venue #{rand(100)}"
    third_venue.save

    get "/venues"

    expect(response.body).to eq(Venue.all.to_json)
  end
end

describe "/venues/[ANY EXISTING VENUE ID]" do
  it "has the details of one venue", :points => 2 do
    first_venue = Venue.new
    first_venue.name = "Venue #{rand(100)}"
    first_venue.save

    second_venue = Venue.new
    second_venue.name = "Venue #{rand(100)}"
    second_venue.save

    third_venue = Venue.new
    third_venue.name = "Venue #{rand(100)}"
    third_venue.save

    get "/venues/#{second_venue.id}"

    expect(response.body).to eq(second_venue.to_json)
  end
end

describe "/users" do
  it "has a list of all users", :points => 2 do
    first_user = User.new
    first_user.username = "alice_#{rand(100)}"
    first_user.save

    second_user = User.new
    second_user.username = "bob_#{rand(100)}"
    second_user.save

    third_user = User.new
    third_user.username = "carol_#{rand(100)}"
    third_user.save

    get "/users"

    expect(response.body).to eq(User.all.to_json)
  end
end

describe "/users/[ANY EXISTING ID]" do
  it "has the details of the user", :points => 2 do
    first_user = User.new
    first_user.username = "alice_#{rand(100)}"
    first_user.save

    second_user = User.new
    second_user.username = "bob_#{rand(100)}"
    second_user.save

    third_user = User.new
    third_user.username = "carol_#{rand(100)}"
    third_user.save

    get "/users/#{second_user.id}"

    expect(response.body).to eq(second_user.to_json)
  end
end

describe "/add_bookmark" do
  it "adds a record to the bookmarks table", :points => 3 do
    first_user = User.new
    first_user.username = "alice_#{rand(100)}"
    first_user.save

    second_user = User.new
    second_user.username = "bob_#{rand(100)}"
    second_user.save

    first_venue = Venue.new
    first_venue.name = "Venue #{rand(100)}"
    first_venue.save

    second_venue = Venue.new
    second_venue.name = "Venue #{rand(100)}"
    second_venue.save

    first_dish = Dish.new
    first_dish.name = "Dish #{rand(100)}"
    first_dish.save

    second_dish = Dish.new
    second_dish.name = "Dish #{rand(100)}"
    second_dish.save

    get "/add_bookmark?input_user_id=#{second_user.id}&input_dish_id=#{second_dish.id}&input_venue_id=#{second_venue.id}"

    new_bookmark = Bookmark.where(
      { 
        :user_id => second_user.id,
        :dish_id => second_dish.id,
        :venue_id => second_venue.id,
      }
    ).at(0)

    expect(new_bookmark).to_not be_nil
  end
end

describe "/users/[ANY EXISTING USER ID]/bookmarks" do
  it "has the list of the user's bookmarks", :points => 3 do
    first_user = User.new
    first_user.username = "alice_#{rand(100)}"
    first_user.save

    second_user = User.new
    second_user.username = "bob_#{rand(100)}"
    second_user.save

    third_user = User.new
    third_user.username = "carol_#{rand(100)}"
    third_user.save

    first_venue = Venue.new
    first_venue.name = "Venue #{rand(100)}"
    first_venue.save

    second_venue = Venue.new
    second_venue.name = "Venue #{rand(100)}"
    second_venue.save
  
    third_venue = Venue.new
    third_venue.name = "Venue #{rand(100)}"
    third_venue.save

    first_dish = Dish.new
    first_dish.name = "Dish #{rand(100)}"
    first_dish.save

    second_dish = Dish.new
    second_dish.name = "Dish #{rand(100)}"
    second_dish.save

    third_dish = Dish.new
    third_dish.name = "Dish #{rand(100)}"
    third_dish.save

    first_bookmark = Bookmark.new
    first_bookmark.user_id = first_user.id
    first_bookmark.venue_id = first_venue.id
    first_bookmark.dish_id = first_dish.id
    first_bookmark.save

    second_bookmark = Bookmark.new
    second_bookmark.user_id = second_user.id
    second_bookmark.venue_id = second_venue.id
    second_bookmark.dish_id = second_dish.id
    second_bookmark.save

    third_bookmark = Bookmark.new
    third_bookmark.user_id = third_user.id
    third_bookmark.venue_id = third_venue.id
    third_bookmark.dish_id = third_dish.id
    third_bookmark.save

    fourth_bookmark = Bookmark.new
    fourth_bookmark.user_id = second_user.id
    fourth_bookmark.venue_id = first_venue.id
    fourth_bookmark.dish_id = third_dish.id
    fourth_bookmark.save

    get "/users/#{second_user.id}/bookmarks"

    expect(response.body).to eq([second_bookmark, fourth_bookmark].to_json)
  end
end

describe "/dishes/[ANY EXISTING DISH ID]/bookmarks" do
  it "has the list of the dish's bookmarks", :points => 3 do
    first_user = User.new
    first_user.username = "alice_#{rand(100)}"
    first_user.save

    second_user = User.new
    second_user.username = "bob_#{rand(100)}"
    second_user.save

    third_user = User.new
    third_user.username = "carol_#{rand(100)}"
    third_user.save

    first_venue = Venue.new
    first_venue.name = "Venue #{rand(100)}"
    first_venue.save

    second_venue = Venue.new
    second_venue.name = "Venue #{rand(100)}"
    second_venue.save
  
    third_venue = Venue.new
    third_venue.name = "Venue #{rand(100)}"
    third_venue.save

    first_dish = Dish.new
    first_dish.name = "Dish #{rand(100)}"
    first_dish.save

    second_dish = Dish.new
    second_dish.name = "Dish #{rand(100)}"
    second_dish.save

    third_dish = Dish.new
    third_dish.name = "Dish #{rand(100)}"
    third_dish.save

    first_bookmark = Bookmark.new
    first_bookmark.user_id = first_user.id
    first_bookmark.venue_id = first_venue.id
    first_bookmark.dish_id = first_dish.id
    first_bookmark.save

    second_bookmark = Bookmark.new
    second_bookmark.user_id = second_user.id
    second_bookmark.venue_id = second_venue.id
    second_bookmark.dish_id = second_dish.id
    second_bookmark.save

    third_bookmark = Bookmark.new
    third_bookmark.user_id = third_user.id
    third_bookmark.venue_id = third_venue.id
    third_bookmark.dish_id = third_dish.id
    third_bookmark.save

    fourth_bookmark = Bookmark.new
    fourth_bookmark.user_id = third_user.id
    fourth_bookmark.venue_id = first_venue.id
    fourth_bookmark.dish_id = second_dish.id
    fourth_bookmark.save

    get "/dishes/#{second_dish.id}/bookmarks"

    expect(response.body).to eq([second_bookmark, fourth_bookmark].to_json)
  end
end

describe "/venues/[ANY EXISTING VENUE ID]/bookmarks" do
  it "has the list of the venue's bookmarks", :points => 3 do
    first_user = User.new
    first_user.username = "alice_#{rand(100)}"
    first_user.save

    second_user = User.new
    second_user.username = "bob_#{rand(100)}"
    second_user.save

    third_user = User.new
    third_user.username = "carol_#{rand(100)}"
    third_user.save

    first_venue = Venue.new
    first_venue.name = "Venue #{rand(100)}"
    first_venue.save

    second_venue = Venue.new
    second_venue.name = "Venue #{rand(100)}"
    second_venue.save
  
    third_venue = Venue.new
    third_venue.name = "Venue #{rand(100)}"
    third_venue.save

    first_dish = Dish.new
    first_dish.name = "Dish #{rand(100)}"
    first_dish.save

    second_dish = Dish.new
    second_dish.name = "Dish #{rand(100)}"
    second_dish.save

    third_dish = Dish.new
    third_dish.name = "Dish #{rand(100)}"
    third_dish.save

    first_bookmark = Bookmark.new
    first_bookmark.user_id = first_user.id
    first_bookmark.venue_id = first_venue.id
    first_bookmark.dish_id = first_dish.id
    first_bookmark.save

    second_bookmark = Bookmark.new
    second_bookmark.user_id = second_user.id
    second_bookmark.venue_id = second_venue.id
    second_bookmark.dish_id = second_dish.id
    second_bookmark.save

    third_bookmark = Bookmark.new
    third_bookmark.user_id = third_user.id
    third_bookmark.venue_id = third_venue.id
    third_bookmark.dish_id = third_dish.id
    third_bookmark.save

    fourth_bookmark = Bookmark.new
    fourth_bookmark.user_id = first_user.id
    fourth_bookmark.venue_id = second_venue.id
    fourth_bookmark.dish_id = third_dish.id
    fourth_bookmark.save

    get "/venues/#{second_venue.id}/bookmarks"

    expect(response.body).to eq([second_bookmark, fourth_bookmark].to_json)
  end
end

describe "/remove_bookmark/[ANY EXISTING BOOKMARK ID]" do
  it "removes a record from the bookmarks table", :points => 3 do
    first_user = User.new
    first_user.username = "alice_#{rand(100)}"
    first_user.save

    second_user = User.new
    second_user.username = "bob_#{rand(100)}"
    second_user.save

    third_user = User.new
    third_user.username = "carol_#{rand(100)}"
    third_user.save

    first_venue = Venue.new
    first_venue.name = "Venue #{rand(100)}"
    first_venue.save

    second_venue = Venue.new
    second_venue.name = "Venue #{rand(100)}"
    second_venue.save
  
    third_venue = Venue.new
    third_venue.name = "Venue #{rand(100)}"
    third_venue.save

    first_dish = Dish.new
    first_dish.name = "Dish #{rand(100)}"
    first_dish.save

    second_dish = Dish.new
    second_dish.name = "Dish #{rand(100)}"
    second_dish.save

    third_dish = Dish.new
    third_dish.name = "Dish #{rand(100)}"
    third_dish.save

    first_bookmark = Bookmark.new
    first_bookmark.user_id = first_user.id
    first_bookmark.venue_id = first_venue.id
    first_bookmark.dish_id = first_dish.id
    first_bookmark.save

    second_bookmark = Bookmark.new
    second_bookmark.user_id = second_user.id
    second_bookmark.venue_id = second_venue.id
    second_bookmark.dish_id = second_dish.id
    second_bookmark.save

    third_bookmark = Bookmark.new
    third_bookmark.user_id = third_user.id
    third_bookmark.venue_id = third_venue.id
    third_bookmark.dish_id = third_dish.id
    third_bookmark.save

    fourth_bookmark = Bookmark.new
    fourth_bookmark.user_id = first_user.id
    fourth_bookmark.venue_id = second_venue.id
    fourth_bookmark.dish_id = third_dish.id
    fourth_bookmark.save

    random_bookmark = Bookmark.all.sample

    get "/remove_bookmark/#{random_bookmark.id}"

    expect(Bookmark.where({ :id => random_bookmark.id }).count).to eq(0)
  end
end

describe "/users/[ANY EXISTING USER ID]/bookmarked_dishes" do
  it "has the list of the user's dishes", :points => 3 do
    first_user = User.new
    first_user.username = "alice_#{rand(100)}"
    first_user.save

    second_user = User.new
    second_user.username = "bob_#{rand(100)}"
    second_user.save

    third_user = User.new
    third_user.username = "carol_#{rand(100)}"
    third_user.save

    first_venue = Venue.new
    first_venue.name = "Venue #{rand(100)}"
    first_venue.save

    second_venue = Venue.new
    second_venue.name = "Venue #{rand(100)}"
    second_venue.save
  
    third_venue = Venue.new
    third_venue.name = "Venue #{rand(100)}"
    third_venue.save

    first_dish = Dish.new
    first_dish.name = "Dish #{rand(100)}"
    first_dish.save

    second_dish = Dish.new
    second_dish.name = "Dish #{rand(100)}"
    second_dish.save

    third_dish = Dish.new
    third_dish.name = "Dish #{rand(100)}"
    third_dish.save

    first_bookmark = Bookmark.new
    first_bookmark.user_id = first_user.id
    first_bookmark.venue_id = first_venue.id
    first_bookmark.dish_id = first_dish.id
    first_bookmark.save

    second_bookmark = Bookmark.new
    second_bookmark.user_id = second_user.id
    second_bookmark.venue_id = second_venue.id
    second_bookmark.dish_id = second_dish.id
    second_bookmark.save

    third_bookmark = Bookmark.new
    third_bookmark.user_id = third_user.id
    third_bookmark.venue_id = third_venue.id
    third_bookmark.dish_id = third_dish.id
    third_bookmark.save

    fourth_bookmark = Bookmark.new
    fourth_bookmark.user_id = second_user.id
    fourth_bookmark.venue_id = second_venue.id
    fourth_bookmark.dish_id = third_dish.id
    fourth_bookmark.save

    get "/users/#{second_user.id}/bookmarked_dishes"

    expect(response.body).to eq([second_dish, third_dish].to_json)
  end
end

describe "/dishes/[ANY EXISTING DISH ID]/experts" do
  it "has the list of the venues that the dish has been bookmarked at", :points => 3 do
    first_user = User.new
    first_user.username = "alice_#{rand(100)}"
    first_user.save

    second_user = User.new
    second_user.username = "bob_#{rand(100)}"
    second_user.save

    third_user = User.new
    third_user.username = "carol_#{rand(100)}"
    third_user.save

    first_venue = Venue.new
    first_venue.name = "Venue #{rand(100)}"
    first_venue.save

    second_venue = Venue.new
    second_venue.name = "Venue #{rand(100)}"
    second_venue.save
  
    third_venue = Venue.new
    third_venue.name = "Venue #{rand(100)}"
    third_venue.save

    first_dish = Dish.new
    first_dish.name = "Dish #{rand(100)}"
    first_dish.save

    second_dish = Dish.new
    second_dish.name = "Dish #{rand(100)}"
    second_dish.save

    third_dish = Dish.new
    third_dish.name = "Dish #{rand(100)}"
    third_dish.save

    first_bookmark = Bookmark.new
    first_bookmark.user_id = first_user.id
    first_bookmark.venue_id = first_venue.id
    first_bookmark.dish_id = first_dish.id
    first_bookmark.save

    second_bookmark = Bookmark.new
    second_bookmark.user_id = second_user.id
    second_bookmark.venue_id = second_venue.id
    second_bookmark.dish_id = second_dish.id
    second_bookmark.save

    third_bookmark = Bookmark.new
    third_bookmark.user_id = third_user.id
    third_bookmark.venue_id = third_venue.id
    third_bookmark.dish_id = third_dish.id
    third_bookmark.save

    fourth_bookmark = Bookmark.new
    fourth_bookmark.user_id = first_user.id
    fourth_bookmark.venue_id = third_venue.id
    fourth_bookmark.dish_id = second_dish.id
    fourth_bookmark.save

    get "/dishes/#{second_dish.id}/experts"

    expect(response.body).to eq([second_venue, third_venue].to_json)
  end
end

describe "/venues/[ANY EXISTING VENUE ID]/specialties" do
  it "has the list of the dishes that the venue has been bookmarked for", :points => 3 do
    first_user = User.new
    first_user.username = "alice_#{rand(100)}"
    first_user.save

    second_user = User.new
    second_user.username = "bob_#{rand(100)}"
    second_user.save

    third_user = User.new
    third_user.username = "carol_#{rand(100)}"
    third_user.save

    first_venue = Venue.new
    first_venue.name = "Venue #{rand(100)}"
    first_venue.save

    second_venue = Venue.new
    second_venue.name = "Venue #{rand(100)}"
    second_venue.save
  
    third_venue = Venue.new
    third_venue.name = "Venue #{rand(100)}"
    third_venue.save

    first_dish = Dish.new
    first_dish.name = "Dish #{rand(100)}"
    first_dish.save

    second_dish = Dish.new
    second_dish.name = "Dish #{rand(100)}"
    second_dish.save

    third_dish = Dish.new
    third_dish.name = "Dish #{rand(100)}"
    third_dish.save

    first_bookmark = Bookmark.new
    first_bookmark.user_id = first_user.id
    first_bookmark.venue_id = first_venue.id
    first_bookmark.dish_id = first_dish.id
    first_bookmark.save

    second_bookmark = Bookmark.new
    second_bookmark.user_id = second_user.id
    second_bookmark.venue_id = second_venue.id
    second_bookmark.dish_id = second_dish.id
    second_bookmark.save

    third_bookmark = Bookmark.new
    third_bookmark.user_id = third_user.id
    third_bookmark.venue_id = third_venue.id
    third_bookmark.dish_id = third_dish.id
    third_bookmark.save

    fourth_bookmark = Bookmark.new
    fourth_bookmark.user_id = first_user.id
    fourth_bookmark.venue_id = second_venue.id
    fourth_bookmark.dish_id = third_dish.id
    fourth_bookmark.save

    get "/venues/#{second_venue.id}/specialties"

    expect(response.body).to eq([second_dish, third_dish].to_json)
  end
end

describe "/venues/[ANY EXISTING VENUE ID]/fans" do
  it "has the list of the users that have bookmarked any dish at the venue", :points => 3 do
    first_user = User.new
    first_user.username = "alice_#{rand(100)}"
    first_user.save

    second_user = User.new
    second_user.username = "bob_#{rand(100)}"
    second_user.save

    third_user = User.new
    third_user.username = "carol_#{rand(100)}"
    third_user.save

    first_venue = Venue.new
    first_venue.name = "Venue #{rand(100)}"
    first_venue.save

    second_venue = Venue.new
    second_venue.name = "Venue #{rand(100)}"
    second_venue.save
  
    third_venue = Venue.new
    third_venue.name = "Venue #{rand(100)}"
    third_venue.save

    first_dish = Dish.new
    first_dish.name = "Dish #{rand(100)}"
    first_dish.save

    second_dish = Dish.new
    second_dish.name = "Dish #{rand(100)}"
    second_dish.save

    third_dish = Dish.new
    third_dish.name = "Dish #{rand(100)}"
    third_dish.save

    first_bookmark = Bookmark.new
    first_bookmark.user_id = first_user.id
    first_bookmark.venue_id = first_venue.id
    first_bookmark.dish_id = first_dish.id
    first_bookmark.save

    second_bookmark = Bookmark.new
    second_bookmark.user_id = second_user.id
    second_bookmark.venue_id = second_venue.id
    second_bookmark.dish_id = second_dish.id
    second_bookmark.save

    third_bookmark = Bookmark.new
    third_bookmark.user_id = third_user.id
    third_bookmark.venue_id = third_venue.id
    third_bookmark.dish_id = third_dish.id
    third_bookmark.save

    fourth_bookmark = Bookmark.new
    fourth_bookmark.user_id = first_user.id
    fourth_bookmark.venue_id = second_venue.id
    fourth_bookmark.dish_id = third_dish.id
    fourth_bookmark.save

    get "/venues/#{second_venue.id}/fans"

    expect(response.body).to eq([first_user, second_user].to_json)
  end
end

describe "/dishes" do
  it "can filter by cuisine ID", :points => 2 do
    first_cuisine = Cuisine.new
    first_cuisine.name = "Cuisine #{rand(100)}"
    first_cuisine.save

    second_cuisine = Cuisine.new
    second_cuisine.name = "Cuisine #{rand(100)}"
    second_cuisine.save

    first_dish = Dish.new
    first_dish.name = "Dish #{rand(100)}"
    first_dish.cuisine_id = first_cuisine.id
    first_dish.save

    second_dish = Dish.new
    second_dish.name = "Dish #{rand(100)}"
    second_dish.cuisine_id = second_cuisine.id
    second_dish.save

    third_dish = Dish.new
    third_dish.name = "Dish #{rand(100)}"
    third_dish.cuisine_id = second_cuisine.id
    third_dish.save


    get "/dishes?cuisine_id=#{second_cuisine.id}"

    expect(response.body).to eq([second_dish, third_dish].to_json)
  end
end

describe "/venues" do
  it "can filter by neighborhood ID", :points => 2 do
    first_neighborhood = Neighborhood.new
    first_neighborhood.name = "Neighborhood #{rand(100)}"
    first_neighborhood.save

    second_neighborhood = Neighborhood.new
    second_neighborhood.name = "Neighborhood #{rand(100)}"
    second_neighborhood.save

    first_venue = Venue.new
    first_venue.name = "Venue #{rand(100)}"
    first_venue.neighborhood_id = first_neighborhood.id
    first_venue.save

    second_venue = Venue.new
    second_venue.name = "Venue #{rand(100)}"
    second_venue.neighborhood_id = second_neighborhood.id
    second_venue.save

    third_venue = Venue.new
    third_venue.name = "Venue #{rand(100)}"
    third_venue.neighborhood_id = second_neighborhood.id
    third_venue.save


    get "/venues?neighborhood_id=#{second_neighborhood.id}"

    expect(response.body).to eq([second_venue, third_venue].to_json)
  end
end

describe "/users/[ANY EXISTING USER ID]/bookmarks" do
  it "can filter by dish ID", :points => 2 do
    first_user = User.new
    first_user.username = "alice_#{rand(100)}"
    first_user.save

    second_user = User.new
    second_user.username = "bob_#{rand(100)}"
    second_user.save

    third_user = User.new
    third_user.username = "carol_#{rand(100)}"
    third_user.save

    first_venue = Venue.new
    first_venue.name = "Venue #{rand(100)}"
    first_venue.save

    second_venue = Venue.new
    second_venue.name = "Venue #{rand(100)}"
    second_venue.save
  
    third_venue = Venue.new
    third_venue.name = "Venue #{rand(100)}"
    third_venue.save

    first_dish = Dish.new
    first_dish.name = "Dish #{rand(100)}"
    first_dish.save

    second_dish = Dish.new
    second_dish.name = "Dish #{rand(100)}"
    second_dish.save

    third_dish = Dish.new
    third_dish.name = "Dish #{rand(100)}"
    third_dish.save

    first_bookmark = Bookmark.new
    first_bookmark.user_id = second_user.id
    first_bookmark.venue_id = first_venue.id
    first_bookmark.dish_id = third_dish.id
    first_bookmark.save

    second_bookmark = Bookmark.new
    second_bookmark.user_id = second_user.id
    second_bookmark.venue_id = second_venue.id
    second_bookmark.dish_id = second_dish.id
    second_bookmark.save

    third_bookmark = Bookmark.new
    third_bookmark.user_id = third_user.id
    third_bookmark.venue_id = third_venue.id
    third_bookmark.dish_id = third_dish.id
    third_bookmark.save

    fourth_bookmark = Bookmark.new
    fourth_bookmark.user_id = second_user.id
    fourth_bookmark.venue_id = second_venue.id
    fourth_bookmark.dish_id = third_dish.id
    fourth_bookmark.save

    get "/users/#{second_user.id}/bookmarks?dish_id=#{third_dish.id}"

    expect(response.body).to eq([first_bookmark, fourth_bookmark].to_json)
  end
end
