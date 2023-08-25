Rails.application.routes.draw do
  delete "tasks/:id", to: "tasks#destroy", as: :delete_task
  patch "tasks/:id", to: "tasks#update"
  get "tasks/:id/edit", to: "tasks#edit", as: :edit_task
  post "tasks", to: "tasks#create"
  get "tasks/new", to: "tasks#new", as: :new_task
  get "tasks/:id", to: "tasks#show", as: :task
  get "tasks", to: "tasks#index"
end
