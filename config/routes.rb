# Rails.application.routes.draw do
#   resources :restaurants do
#     resources :reviews, only: %w[:index :new :create]
#   end
#   resources :reviews, only: %w[:show :edit :update :destroy]
# end

Rails.application.routes.draw do
  resources :restaurants do
    resources :reviews
  end
  resources :reviews, only: [:destroy]
end
