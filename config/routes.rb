Rails.application.routes.draw do
  resources :messages
  get 'tests/create'

  get 'home/index'

  root 'home#index'

  post 'user/new' => 'users#create'

  get 'user/sign_in' => 'users#sign_in'
  post 'user/authenticate_user' => 'users#authenticate_user'

  delete 'sign_out' => 'users#delete_user_session'
  get 'message/show' => 'messages#show'

  resource :users

end
