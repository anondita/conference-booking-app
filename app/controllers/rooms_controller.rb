class RoomsController < ApplicationController
  def show
   @room = Room.find(params[:id])
  end
def new
	@room= Room.new
end
def index
	@room= Room.all
end
def create
@room = Room.new(room_params)
if current_user.admin?
 if @room.save
    flash[:success] = "room successfully created"
 redirect_to rooms_url
else 
render 'new'
end
  else
	flash[:info] = "Sorry! only admin can create room"
    redirect_to @room
end
end
def destroy
	if current_user.admin?
		Room.find(params[:id]).destroy
	    flash[:success] = "Room deleted"
	    redirect_to rooms_url
	end
end
private
def room_params
 params.require(:room).permit(:name,:capacity)
end
end
