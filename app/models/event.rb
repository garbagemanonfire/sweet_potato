# Model the contains relationships and validation for events.
class Event < ActiveRecord::Base
  has_many :retreatregs, dependent: :destroy
  has_many :users, through: :retreatregs
  belongs_to :organizer, class_name: "User"
  geocoded_by :address
  after_validation :geocode

  def address
    [address_1, address_2, state].compact.join(', ')
  end

  validates :title, presence: true, length: { maximum: 100 }
  validates :organizer_id, presence: true
  # add in future for Eventbrite API
  # validates :e_id, presence: true, uniqueness: true
  VALID_ADDRESS_REGEX = /^[\w\s-]*$/u
  validates :address_1, presence: true, format: { with: VALID_ADDRESS_REGEX,
                                                  multiline: true }
end
