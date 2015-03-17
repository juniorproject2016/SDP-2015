json.array!(@business_categories) do |business_category|
  json.extract! business_category, :id, :businessName, :category
  json.url business_category_url(business_category, format: :json)
end
