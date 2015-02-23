class Business < ActiveRecord::Base


validates :name,  presence: true, length: { minimum: 2, maximum: 20 }
validates :category,  presence: true, length: { minimum: 2, maximum: 20 }


end
