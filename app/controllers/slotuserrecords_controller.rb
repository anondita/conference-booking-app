class SlotuserrecordsController < ApplicationController
	def new
		@slotuserrecord = Slotuserrecord.new
	end
	def create
		
		@slotuserrecord = Slotuserrecord.new(:slot_id => params[:slot_id], :user_id => params[:user_id])
		if @slotuserrecord.save
			flash[:success]='user added'
	else
       flash[:danger]='Cannot add anymore users'
       redirect_to showroom_url(@slotuserrecord.slot_id)
   end
	end
	def show

	end
end
