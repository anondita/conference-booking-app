class SlotsController < ApplicationController

	def new
		@slot= Slot.new
	end

	def create
		@room = Room.find(params[:room_id])
		 @slot = @room.slots.create(slot_params)
		 if @slot.save
		redirect_to rooms_path(@room)
	else
		render 'new'
	end
	end

	def show
		@slot = Slot.find(params[:id])
	end

	def index
	end

	private
	
	def slot_params
		params.require(:slot).permit(:name,:starttime,:endtime,:dateofslot)
	end
end
