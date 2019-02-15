Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	namespace 'api' do
		namespace 'v1' do
			
	  		resources :orders, only: [:create] do
	  			collection do
	  				get 'getStatus/:id', controller: 'orders', action: 'getStatus', as: 'getStatus'
	  				get 'getOrdersByPChannel/:pchannel', controller: 'orders', action: 'getOrdersByPChannel', as: 'getOrdersByPChannel'
	  			end
	  		end

	  		resources :batches, only: [:create] do
	  			collection do
	  				post 'produceBatch/:batch_id', controller: 'batches', action: 'produceBatch', as: 'produceBatch'
	  				post 'markOrderAsSent/:batch_id/:delivery_service', controller: 'batches', action: 'markOrderAsSent', as: 'markOrderAsSent'
	  			end
	  		end

	  		resources :reports do
	  			collection do
	  				get 'getSimpleReport', controller: 'reports', action: 'getSimpleReport', as: 'getSimpleReport'
	  			end
	  		end

  		end
  	end
end
