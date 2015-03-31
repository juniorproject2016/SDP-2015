json.array!(@suggested_businesses) do |suggested_business|
  json.extract! suggested_business, :id, :requester, :business_name
  json.url suggested_business_url(suggested_business, format: :json)
end
