class Slotuserrecord < ApplicationRecord
	belongs_to :user
	belongs_to :slot
	validate :count_of_user

def count_of_user
 puts self.slot.slotuserrecords.size
 puts self.slot.room.capacity

	if ( self.slot.slotuserrecords.size > self.slot.room.capacity)
		errors.add(:user_id, 'cannot add user beyond capacity')
	end
end
end
