FactoryBot.define do

  factory :user do
    sequence(:name, 10){|n| "user#{n}"}
    password  {'qwerty123'}
    sequence(:email, 10){|n| "example#{n}@email.com"}    
  	created_at {Time.now} 
  end

end