class RoomsController < ApplicationController
  before_filter :require_authentication, :only => [:new, :edit, :create,
    :update, :destroy]
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = Room.all
  end

  def show
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to @room, :notice => t('flash.notice.room_created')
    else
      render action: :new
    end
  end

  def update
    if @room.update(room_params)
      redirect_to @room, :notice => t('flash.notice.room_updated')
    else
      render action: :edit
    end
  end

  def destroy
    @room.destroy
    redirect_to rooms_url
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:title, :location, :description)
    end
end
