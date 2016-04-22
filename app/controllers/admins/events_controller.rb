class Admins::EventsController < ApplicationController
  layout 'admin'
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        format.js
        format.html { redirect_to admins_event_path(@event), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.js
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.js
        format.html { redirect_to admins_event_path(@event), notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to admins_events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def calendar_events
    @events = Event.all
    events = []
    @events.each do |event|
      event_hash = {}
      event_hash["id"] = event.id
      event_hash["title"] = event.title
      event_hash["start"] = event.start_date
      event_hash["end"] = event.end_date
      event_hash["description"] = event.description
      events << event_hash
    end
    render :json => events
  end

  def calendar
  end

  def get_event
    @event = Event.find(params[:event_id])
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :description, :start_date, :end_date)
    end
end
