Rails.application.routes.draw do
  get 'friend/index'

  get 'friend/show'

  get 'user/my_friend_request' => 'users#my_friend_request'

  post 'friend/add_friend' => 'friend#add_friend'

  post 'friend/friend_accept' => 'friend#friend_accept'

  post 'friend/friend_deny' => 'friend#friend_deny'

  post 'friend/un_friend' => 'friend#un_friend'

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
