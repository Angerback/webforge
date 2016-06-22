Rails.application.routes.draw do

  resources :courses

  root                'home#index'

  # Academic contents
  get 'introduction'   => 'intro#index'
  get 'heuristics' => 'heuristics#index'
  get 'heuristics/:heuristic_id' => 'heuristics#show'
  get 'heuristic_evaluation' => 'heuristic_evaluations#index'

  # Evaluation
  get 'evaluations' => 'evaluations#index'
  get 'evaluations/:evaluation_id' => 'evaluations#show'
  get 'begin/:evaluation_id' => 'evaluations#begin'
  get 'continue/:evaluation_id' => 'evaluations#continue'
  get 'evaluations/:evaluation_id/questions/:question_id' => 'questions#show'
  post 'evaluations/:evaluation_id/go/:question_id' => 'questions#go'

  # Chat
  get 'chats' => 'chats#index'
  get 'chats/:id' => "chats#show"
  get 'chats/:id/messages/new' => 'messages#new'
  post 'chats/:id/messages/create' => 'messages#create'

  # Practice
  get 'practices' => 'practices#index'
  get 'practices/:id' => 'practices#show'
  post 'exercises/create' => 'exercises#create'
  post 'exercises/update' => 'exercises#update'
  get 'bank_terminals' => 'bank_terminals#index'
  get 'metro'          => 'metro#index'

  #Recursos

  get 'references' => 'references#index'

  # Devise
  #devise_for :users, :path => '',
  #  :path_names => {
  #    :sign_in => 'login',
  #    :sign_out => 'logout',
  #    :sign_up => 'register'
  #  }

  resources :users, :records

  # API RESTful
  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      # Users
      get 'users/:rut', to: 'users#show'
      get 'users', to: 'users#index'

      # Bank Accounts
      get 'bank_accounts/:user_id', to: 'bank_accounts#show'
      put 'bank_accounts/:user_id', to: 'bank_accounts#update'
      post 'bank_accounts', to: 'bank_accounts#create'

      # Records
      get 'records/:owner_id', to: 'records#index'

      # Sessions
      post 'sessions/:rut', to: 'sessions#create'

      # Exercises
      post 'users/:user_id/practices/:practice_id', to: 'exercises#create'

    end
  end

 # API RESTful webforge
  namespace :api, defaults: { format: :json } do
    namespace :v2 do

      # Users
			get 'users', to: 'users#index'
			get 'users/:id', to: 'users#show'
      post 'users', to: 'users#create'
      delete 'users/:id', to: 'users#destroy'
      put 'users/:id', to: 'users#update'

      post 'users/start_session', to: 'users#start_session'
      post 'users/end_session', to: 'users#end_session'

      # Courses
      get 'courses', to: 'courses#index'
      get 'courses/:id', to: 'courses#show'
      post 'courses', to: 'courses#create'
      delete 'courses/:id', to: 'courses#destroy'
      put 'courses/:id', to: 'courses#update'


      get 'courses/:id/users', to: 'courses#users'
      post 'courses/:id/users/:userId', to: 'courses#addUser'

      # Evaluations
      get 'evaluations', to: 'evaluations#index'
      get 'evaluations/:id', to: 'evaluations#show'

      # Grades
      get 'users/:id/grades', to: 'users#show_grades'

      # Chats
      get 'chats', to: 'chats#index'
      get 'chats/:id', to: 'chats#show'

      # Messages
      post 'chats/:id/messages', to: 'messages#create'

      #Exercises
      post 'exercises', to: 'exercises#create'
      put 'exercises', to: 'exercises#update'
      put 'exercises/:id', to: 'exercises#update'
      get 'users/:user_id/exercises', to: 'exercises#index'

      #Topics
      get 'topics', to: 'topics#index'

      #practices
      get 'practices', to: 'practices#index'

      #Questions
      get 'questions', to: 'questions#index'

      #Alternatives
      get 'alternatives', to: 'alternatives#index'

      #Compositions
      get 'compositions', to: 'compositions#index'

      #Test
      post 'users/:user_id/tests', to: 'tests#create'

      #Answers
      post 'tests/:test_id/answers', to: 'answers#create'

      #Heuristics
      get 'heuristics', to: 'heuristics#index'
      get 'heuristics/:heuristic_id', to: 'heuristics#show'

      #Foro
      get 'forum', to: 'themes#index'
      get 'comments', to: 'comments#index'

    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
