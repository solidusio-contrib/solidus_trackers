Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :trackers
  end
end
