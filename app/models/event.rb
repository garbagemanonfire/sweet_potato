class Event < ActiveRecord::Base
    validates :title, presence: true,length: { maximum: 100 }
    validates :organizer_id, presence: true
    validates :e_id, presence: true, uniqueness: true
    VALID_ADDRESS_REGEX = /^[\w\s-]*$/u
    validates :address_1, presence: true, format: { with: VALID_ADDRESS_REGEX, multiline: true }
end
