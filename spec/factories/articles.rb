FactoryBot.define do

  factory :article do
    sequence(:title, 10){|n| "Title #{n}"}
    sequence(:content, 10){|n| "Some content for #{n} article"}
    created_at {Time.now}    
  end

end