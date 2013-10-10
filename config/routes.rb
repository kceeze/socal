Socal::Application.routes.draw do
  root to: "socals#index"
  resources :commands
  resources :songs
end
