Rails.application.routes.draw do

  #cuisines
  match("/cuisines", {:controller => "application", :action => "list_cuisines", :via => "get"} )

  #dishes
  match("/dishes", {:controller => "application", :action => "list_dishes", :via => "get"} )
  match("/dishes/:id", {:controller => "application", :action => "dish_details", :via => "get"} )
  match("/dishes/:id/bookmarks", {:controller => "application", :action => "list_dish_bookmarks", :via => "get"} )

  #neighborhoods
  match("/neighborhoods", {:controller => "application", :action => "list_neighborhoods", :via => "get"} )

  #venues
  match("/venues", {:controller => "application", :action => "list_venues", :via => "get"} )
  match("/venues/:id", {:controller => "application", :action => "venue_details", :via => "get"} )
  match("/venues/:id/bookmarks", {:controller => "application", :action => "list_venue_bookmarks", :via => "get"} )

  #users
  match("/users", {:controller => "application", :action => "list_users", :via => "get"} )
  match("/users/:id", {:controller => "application", :action => "user_details", :via => "get"} )
  match("/users/:id/bookmarks", {:controller => "application", :action => "list_user_bookmarks", :via => "get"} )

  #bookmark
  match("/add_bookmark", {:controller => "application", :action => "add_bookmark", :via => "get"} )
  match("/remove_bookmark", {:controller => "application", :action => "remove_bookmark", :via => "get"} )








  # ====================================================
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
