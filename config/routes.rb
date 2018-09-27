Rails.application.routes.draw do
  root 'chats#new'

  get 'login', to: 'student_sessions#new'
  get 'logon', to: 'students#new'
  delete 'logout', to: 'student_sessions#destroy'

  resource :admin_sessions, only: [:new, :create, :destroy], constraints: {format: :html}
  resource :student_sessions, only: [:new, :create, :destroy]
  resource :teacher_sessions, only: [:new, :create, :destroy]

  resources :admins, constraints: {format: :html}
  resources :teachers
  resources :students
  resources :chats, only: [:index, :new, :show], constraints: {format: :html}

  resources :admin_chattings, only: [:create, :destroy], constraints: {format: :json}
  resources :teacher_chattings, only: [:create, :destroy], constraints: {format: :json}
  resources :student_chattings, only: [:create, :destroy], constraints: {format: :json}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
