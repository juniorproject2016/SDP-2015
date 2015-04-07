class SuggestedBusiness < ActiveRecord::Base

#to verify if it exists
def verified
 require 'open-uri'
  require 'nokogiri'
  url = "http://www.iconosquare.com/#{self.business_name}"
  data = Nokogiri::HTML(open(url))
  data.at_css("title").text == ("404 not found") 
  rescue => e
	return true
  
end




end
