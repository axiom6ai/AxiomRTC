Rails.application.routes.draw do
  root 'chats#index'

  get 'admin/login', to: 'admin_sessions#new', constraints: {format: :html}
  delete 'admin/logout', to: 'admin_sessions#destroy', constraints: {format: :html}
  get 'teacher/login', to: 'teacher_sessions#new'
  delete 'teacher/logout', to: 'teacher_sessions#destroy'
  get 'student/login', to: 'student_sessions#new'
  get 'student/logon', to: 'students#new'
  delete 'student/logout', to: 'student_sessions#destroy'

  resources :admins, constraints: {format: :html}
  resources :teachers
  resources :students
  resources :chats, except: [:destroy]

  resource :admin_sessions, only: [:new, :create, :destroy], constraints: {format: :html}
  resource :student_sessions, only: [:new, :create, :destroy]
  resource :teacher_sessions, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
