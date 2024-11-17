Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :book_clubs do
        member do
          get :analytics
          get :books
        end
        resources :book_summaries, shallow: true
      end
      resources :books do
        resources :book_summaries, shallow: true
      end
    end
  end
end