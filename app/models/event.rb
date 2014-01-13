class Event < ActiveRecord::Base
    has_many :retreatregs, foreign_key: "user_id", dependent: :destroy
    # has_many :users
    has_many :reverse_retreatregs, foreign_key: "event_id",
                                   class_name:  "retreareg",
                                   dependent:   :destroy
    has_many :users, through: :reverse_retreatregs, source: :user

    validates :title, presence: true,length: { maximum: 100 }
    validates :organizer_id, presence: true
    validates :e_id, presence: true, uniqueness: true
    VALID_ADDRESS_REGEX = /^[\w\s-]*$/u
    validates :address_1, presence: true, format: { with: VALID_ADDRESS_REGEX, multiline: true }
end
