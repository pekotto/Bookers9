Rails.application.routes.draw do

  get 'chat/:id' => 'chats#show', as: 'chat'

  resources :chats, only: [:create]

  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  root 'home#top'
  get 'home/about'
end