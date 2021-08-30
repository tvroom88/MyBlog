Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # devise_for :users, controllers: { sessions: 'users/sessions' }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get "home/index"
  get "home/blog"
  get "home/keyword"
  get "home/blog_board"

  post "api/post"
  post "api/alarm_keyword"
  get "api/alarm_keyword/:keyword_id" => "api#alarm_keyword", :as => "destroy"

  root "home#index"
end
