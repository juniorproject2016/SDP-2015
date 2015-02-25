class BusinessCategory < ActiveRecord::Base

belongs_to :business
belongs_to :category


validates :business_id, presence: true, length: {minimum: 1, maximum: 20 }
validates :category_id, presence: true, length: {minimum: 1, maximum: 20 }

#for now ignore the bottom code
def self.by_nameB(name)
	if !name.empty?
		self.joins(:business).where('business.name = ?', name)
	else
		self.all
	end
	end
	
def self.by_nameC(name)
	if !name.empty?
		self.joins(:category).where('category.name = ?', name)
	else
		self.all
	end
	end

end
