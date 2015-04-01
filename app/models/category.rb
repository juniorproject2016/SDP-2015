class Category < ActiveRecord::Base

has_many :business_categories
has_many :businesses, through: :business_categories

validates :name,  presence: true, length: { minimum: 2, maximum: 50 }

end
