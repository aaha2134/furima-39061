FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name_kanji      {'山田'}
    last_name_kanji       {'太郎'} 
    first_name_kana       {'ヤマダ'}
    last_name_kana        {'タロウ'}
    birth_date            {1945/7/17}

  end
end