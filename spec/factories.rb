FactoryGirl.define do

  factory :user do
    email    'csmith@example.com'
    password 'password1'
    password_confirmation 'password1'
    id  '0'
  end

  factory :event do
    id           '1'
    title        'Example Event'
    address_1    '10 Park Place'
    organizer_id  '0'
  end

end
