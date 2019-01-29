class Slot < ApplicationRecord
belongs_to :room
has_many :slotuserrecords
has_many :users ,through: :slotuserrecords
 validates :name, presence: true
 validates :starttime, presence: true, if: :starttime_validate
 validates :endtime, presence: true, if: :endtime_validate
  validate :date_cannot_be_in_the_past
   validate :end_must_be_after_start

  def end_must_be_after_start
  if starttime + 1800 >= endtime
    errors.add(:endtime, "must be atleast after 30 minutes from start time")
  end
end

 def date_cannot_be_in_the_past
   if (dateofslot.present? && dateofslot.past?)
      errors.add(:dateofslot, "can't be in the past")
    end
  end 

  def starttime_validate
  	current_time = starttime
  	if (current_time.to_time.hour < 9 || current_time.to_time.hour >18)
  		errors.add(:starttime, "can't start before 9:00am or after 6:00pm")
  end   
end
  def endtime_validate
  	current_time =endtime
  	if (current_time.to_time.hour < 9 || current_time.to_time.hour >18)
  		errors.add(:endtime, "can't end before 9:00am or after 6:00pm")
  end  
end 

end
