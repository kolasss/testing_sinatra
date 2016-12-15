FactoryGirl.define do
  to_create { |instance| instance.save }
  
  factory :post do
    title "Post Titile"
    body  "Post Body"
  end
end