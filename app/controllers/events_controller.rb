class EventsController < ApplicationController
  before_action :find_events, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all.order("created_at DESC")
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(events_params)

    if @event.save
      redirect_to @event
    else
      render "New"
    end
  end

  def update
    if @event.update(events_params)
      redirect_to @event
    else
      render "Edit"
    end
  end

  def edit
  end

  def destroy
    @event.destroy
    redirect_to root_path
  end

  private

    def events_params
      params.require(:event).permit(:name, :description, :address)
    end

    def find_events
      @event = Event.find(params[:id])
    end

    
end
