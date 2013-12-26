GuessWord::Application.routes.draw do
  resources :guess_activities

  devise_for :admins
  resources :words

  resources :guesses

  resources :judge_activities

  resources :judges

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'game#home'

  # Example of regular route:
  post 'guess' => 'game#guess', as: 'do_guess'
	get 'guess', to: redirect('home')
	post 'judge' => 'game#judge', as: 'do_judge'
	get 'judge', to: redirect('home')
	get 'home' => 'game#home', as: 'home'
	get 'test' => 'game#test', as: 'test'
	get 'guessed' => 'game#guessed', as: 'guessed'

	get 'admin' => 'admin#home', as: 'admin_home'
	get 'users' => 'admin#users'

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
