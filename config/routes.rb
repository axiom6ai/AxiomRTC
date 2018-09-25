Rails.application.routes.draw do
  root 'chats#index'

  get 'login', to: 'student_sessions#new'
  get 'logon', to: 'students#new'
  delete 'logout', to: 'student_sessions#destroy'

  resources :admins, constraints: {format: :html}
  resources :teachers
  resources :students
  resources :chats, except: [:destroy]

  resource :admin_sessions, only: [:new, :create, :destroy], constraints: {format: :html}
  resource :student_sessions, only: [:new, :create, :destroy]
  resource :teacher_sessions, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end