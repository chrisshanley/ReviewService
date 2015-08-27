class ReviewControllerController < ApplicationController
  
	def index
		render :json => Review.all
	end

	def reviews_for_item
		reviews = Review.where( "item_id = ? ", params[:item_id])
		render :json => reviews
		
	end

	def reviews_for_user
		reviews =  Review.where( "reviewer_id = ? ", params[:reviewer_id])
		render :json => reviews
	end

  	def create
	  	type   =  params[:review][:review_type]
	  	review_type = ReviewType.where( "name = ? ", type).first
	  	if review_type == nil 
	  		render :json => {:error => "type #{params[:review][:review_type]} not supported", },:status => 422 
	  	else
			hash   =  {
		  		:reviewer_id => params[:review][:reviewer_id],
				:rating      => params[:review][:rating],
				:notes 		 => params[:review][:notes],
				:item_id 	 => params[:review][:item_id],
			} 

			review = Review.where( "reviewer_id = ? AND item_id = ? AND review_type_id = ?", hash[:reviewer_id], hash[:item_id],review_type.review_type_id).first
			if review == nil
				review = Review.new( hash )
				if review.valid?
					review.review_type_id = review_type.review_type_id
					review.save
		  			render :json => review
				else
					render :json => {:error => "can not construct review object, required keys are : reviewer_id, rating, item_id", },:status => 422 
				end
			else
				review.rating = hash[:rating]
				review.notes  = hash[:notes]
				review.save
		  		render :json => review
			end
		end
	end
end
