class SlotuserrecordsController < ApplicationController
	
	def new
		@slotuserrecord = Slotuserrecord.new
	end

	def create
		
		@slotuserrecord = Slotuserrecord.new(:slot_id => params[:slot_id], :user_id => params[:user_id])
		@roomid= @slotuserrecord.slot.room.id
		if @slotuserrecord.save
			flash[:success]='user added successfully'
			redirect_to room_slot_path(@roomid,@slotuserrecord.slot_id)
		else
			byebug
       		flash[:danger]='Cannot add anymore users'
       		redirect_to room_slot_path(@roomid,@slotuserrecord.slot_id)
    	end
	end

	def show

	end
end
