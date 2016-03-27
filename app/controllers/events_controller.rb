class EventsController < ApplicationController

before_action :authenticate_user!, :except => [:index]
before_action :set_event, :only => [ :show, :edit, :update, :destroy]

def index
  @events = Event.page(params[:page]).per(10)
end

def new
  @event = Event.new
end

def show
  @page_title = @event.name
  @massages = @event.massages
  @massage = @event.massages.build
end

def edit
end

def update
  if @event.update(event_params)
    flash[:notice] = "修改成功!"
    redirect_to event_url(@event)
  else
    render :action => :edit
  end
end

def create
  @event = Event.new(event_params)
  flash[:notice] = "成功建立!"

  @event.user = current_user

  if @event.save
    redirect_to events_url
  else
    render :action => :new
  end
end

def destroy
  @event.destroy
  flash[:alert] = "刪除成功!"
  redirect_to events_url
end


private

def event_params
  params.require(:event).permit(:name, :description, :category_id)
end

def set_event
  @event = Event.find(params[:id])
end

end
