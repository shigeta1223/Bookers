Rails.application.routes.draw do
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit' => 'book#list', as: 'book_list'
  #patch 'books/:id' => 'books#update', as: 'update_book'
  resources :books do
    get 'edit', on: :member
end

  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
