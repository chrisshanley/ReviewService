Rails.application.routes.draw do
  scope '/api' do 
    scope '/v1' do
   	  get '/reviews' => 'review_controller#index'
      get '/reviews/:item_id'  => 'review_controller#reviews_for_item'
      get '/reviewer/:reviewer_id'  => 'review_controller#reviews_for_user'
      post '/review'  => 'review_controller#create'

    end
  end
end
