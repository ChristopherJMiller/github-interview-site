FactoryBot.define do
  factory :user do
    provider { 'github' }
    uid { '12345' }
    email { FFaker::Internet.email }
    name { FFaker::Name.name }
    nickname { FFaker::Name.first_name }
    bio { FFaker::HipsterIpsum.phrase }
    website { FFaker::Internet.http_url }
    avatar { FFaker::Image.url }
  end
end
