Rails.application.routes.draw do
  root 'boards#index'
  resources :boards, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  
  resources :boards do
    resources :comments, only: [:create, :destroy] do
      member do
        post 'toggle_read'
      end
    end
  end
end
