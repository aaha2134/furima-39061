FactoryBot.define do
  factory :item do

    image                 { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    product_name          {'機械'}
    description           {'機械です'}
    category_id           {Faker::Number.between(from: 2, to: 11)}
    condition_id          {Faker::Number.between(from: 2, to: 7)}
    fee_id                {Faker::Number.between(from: 2, to: 3)}
    area_id               {Faker::Number.between(from: 2, to: 48)}
    deliverytime_id       {Faker::Number.between(from: 2, to: 4)}
    price                 {Faker::Commerce.price(range: 300..9999999).to_i}
    user                  {FactoryBot.create(:user) }

  end
  
end
