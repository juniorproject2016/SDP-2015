class Business < ActiveRecord::Base

has_many :business_categories
has_many :categories, through: :business_categories

validates :name,  presence: true, length: { minimum: 2, maximum: 50 }


end
