class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :invitations, foreign_key: :event_id
  has_many :attendees, through: :invitations

  def self.upcoming
    where("start > ?", DateTime.now)
  end

  def self.past
    where("start < ?", DateTime.now)
  end
end
