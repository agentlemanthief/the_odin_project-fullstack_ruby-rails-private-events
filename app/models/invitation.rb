class Invitation < ApplicationRecord
  belongs_to :event, foreign_key: :event_id, class_name: 'Event'
  belongs_to :attendee, foreign_key: :attendee_id, class_name: 'User'
end
