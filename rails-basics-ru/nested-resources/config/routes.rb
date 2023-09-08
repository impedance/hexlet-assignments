# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  # BEGIN
  
  resources :posts do
    resources :comments, only: %i[edit destroy update create]
  end
  # END
end
