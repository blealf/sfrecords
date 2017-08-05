Rails.application.routes.draw do


  
  
  mount Ckeditor::Engine => '/ckeditor'
  resources :accesories
   #post		'user_items/:id/edit'	=>	'user_items#edit'
  get      'abouts'     =>  'accesories#about'
  get      'contacts'   =>  'accesories#contact'
  get      'terms'      =>  'accesories#term'
  get      'budgets'    =>  'budgets#new'
  get      'wishlists'  =>  'wishlists#new'
  get		   'incomes'	  =>  'incomes#new'
  get		   'signup' 		=>	'users#new'
  get		   'login'			=>	'sessions#new'
  post		 'login'			=>	'sessions#create'
  delete	 'logout'		  =>	'sessions#destroy'
  #delete   'budgets/:budget_id/proposed_incomes/:id' => 'proposed_incomes#destroy'



  resources :wishlists,   only: [ :create, :edit, :update, :destroy]
  resources :incomes,     only: [ :create, :edit, :update, :destroy]
  resources :user_items,  only: [ :create, :edit, :update, :destroy]

  resources :budgets do 
      resources :proposed_items,   only: [ :create, :destroy]
      resources :proposed_incomes, only: [ :create, :destroy]
  end
  
  resources :users
  
  root 'user_items#new'
  #root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
