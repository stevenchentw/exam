class EventMassagesController < ApplicationController

before_action :find_event

def index
  @massages = @event.massages
end

def show
  @massage = @event.massages.find( params[:id] )
end

def new
  @massage = @event.massages.build
end

def create
  @massage = @event.massages.build( massage_params )
  if @massage.save
    redirect_to event_massages_url( @event )
  else
    render :action => :new
  end
end

def edit
  @massage = @event.massages.find( params[:id] )
end

def update
  @massage = @event.massages.find( params[:id] )

  if @massage.update( massage_params )
    redirect_to event_massages_url( @event )
  else
    render :action => :edit
  end

end

def destroy
  @massage = @event.massages.find( params[:id] )
  @massage.destroy

  redirect_to event_massages_url( @event )
end

protected

def find_event
  @event = Event.find( params[:event_id] )
end

def massage_params
  params.require(:massage).permit(:name)
end

end


