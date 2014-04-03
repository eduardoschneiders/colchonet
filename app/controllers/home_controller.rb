class HomeController < ApplicationController
  def index
    rooms = Room.take 3
    @rooms = RoomCollectionPresenter.new(rooms, self)
  end
end
