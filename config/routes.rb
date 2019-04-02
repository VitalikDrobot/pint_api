# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pins do
        member do
          put 'like', to: 'pins#upvote'
        end
      end
    end
  end
  post 'authenticate', to: 'authentication#authenticate'
  root to: 'pins#index'
end
