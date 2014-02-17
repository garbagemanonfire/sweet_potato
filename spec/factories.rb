FactoryGirl.define do

  factory :user do
    email    'csmith@example.com'
    password 'password1'
    password_confirmation { password }
    id  '0'
  end

  factory :event do
    id           '0'
    title        'Example Event'
    address_1    '10 Park Place'
    organizer_id  '0'
    start_date    Date.today
    end_date      Date.today
  end

end
