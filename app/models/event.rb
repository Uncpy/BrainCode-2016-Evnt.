class Event < ActiveRecord::Base
  belongs_to :user
  has_many :invites,    :foreign_key => :attended_event_id
  has_many :attendees,  through:       :invites


  geocoded_by :address

  after_validation :geocode, :if => :address_changed?

end
