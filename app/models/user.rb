class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :retreatregs, dependent: :destroy
  has_many :events, through: :retreatregs

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def engaging?(event)
    retreatregs.find_by(event_id: event.id)
  end

  def engage!(event)
    retreatregs.create!(event_id: event.id)
  end

  def disengage!(event)
    retreatregs.find_by(event_id: event.id).destroy!
  end
end
