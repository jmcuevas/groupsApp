Rails.application.routes.draw do
    root 'sessions#index'

    get 'sessions/index' => 'sessions#index'
    post 'sessions' => 'sessions#create'
    delete 'sessions' => 'sessions#destroy'

    post 'users' => 'users#create'

    get 'groups' => 'groups#index'
    post 'groups' => 'groups#create'
    delete 'groups/:id' => 'groups#destroy'
    get 'groups/:id' => 'groups#show'

    post 'members' => 'members#create'
    delete 'members' => 'members#destroy'
end
