class EventsController < ApplicationController
  before_action :find_events, only: [:show, :edit, :update, :destroy]
  before_action :authenticate!, except: [:index, :show]

  def index
    @events = Event.all.order("created_at DESC")
    get_current_user_location
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees.all
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(events_params)

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
      params.require(:event).permit(:name, :description, :address, :max, :date, :latitude, :longitude)
    end

    def find_events
      @event = Event.find(params[:id])
    end

    
end
