class Review < ActiveRecord::Base
	validates_presence_of :reviewer_id
	validates_presence_of :rating
	validates_presence_of :item_id
end
