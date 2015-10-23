Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :teams
  resources :members
  resources :qas

  #post '/members' => 'members#add_member_to_team'
end
