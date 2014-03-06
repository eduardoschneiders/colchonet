class RoomsController < ApplicationController
  PER_PAGE = 2
  before_action :require_authentication, only: [:new, :edit, :create, :update, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @search_query = params[:q]

    rooms = Room.search(@search_query).
      page(params[:page]).
      per(PER_PAGE)
    @rooms = RoomCollectionPresenter.new(rooms.most_recent, self)
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    room_model = Room.friendly.find(params[:id])
    @room = RoomPresenter.new(room_model, self)
  end

  # GET /rooms/new
  def new
    @room = current_user.rooms.build
  end

  # GET /rooms/1/edit
  def edit
    @room = current_user_room
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = current_user.rooms.build(room_params)

    if @room.save
      redirect_to @room, notice: t('flash.notice.room_created')
    else
      render action: :new
    end
  end

  def update
    @room = current_user_room

    if @room.update(room_params)
      redirect_to @room, notice: t('flash.notice.room_updated')
    else
      render action: :edit
    end
  end

  def destroy
    @room = current_user_room
    @room.destroy
    redirect_to rooms_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def current_user_room
      current_user.rooms.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:title, :location, :description)
    end
end
