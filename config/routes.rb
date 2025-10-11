Rottenpotatoes::Application.routes.draw do
  resources :movies do
    collection do
      get 'search_tmdb'
      post 'add_tmdb_movie',  to: 'movies#add_tmdb_movie'
    end
  end
  
  # map '/' to be a redirect to '/movies'
  root to: redirect('/movies')
end