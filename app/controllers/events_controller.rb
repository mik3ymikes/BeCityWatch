class EventsController < ApplicationController
    # before_action :set_event, only: [:show, :update, :destroy] maybe need this??!?
    # before_action :authenticate_request, only: [:create]
    
    # before_action :authenticate_request, except: [:index] 
    before_action :set_event, only:[:update, :destroy, :show]
    before_action :authenticate_request, except: [:index, :show] 
     
     def index
        # events=Event.all
         events=Event.order(created_at: :desc).page(params[:page]).per(20)

        render json:{
         events: EventBlueprint.render_as_hash(events, view: :short),
         total_pages: events.total_pages,
         current_page: events.current_page
        }



        # render json: {
        # events: EventBlueprint.render_as_hash(events, view: :long), status: :ok
        # }

        # render json:events, status: :ok
        # render json:EventBlueprint.render_as_hash(@event, view: :long), status: :ok
     
 
     end
 
     def show
        render json: EventBlueprint.render_as_hash(@event, view: :long, current_user: @current_user), status: :ok
     end
 

   
 
     def create
    #    event=@current_user.created_events.new(event_params) may need with created events in user


    #    event=@current_user.add_event.new(event_params)
   
       event = @current_user.created_events.new(event_params)

    
 
       if event.save
         render json: event, status: :created 
 
       else
         render json: event.errors, status: :unprocessable_entity
       end
     end
 
     def update
         if @event.update(event_params)
             render json: @event, status: :ok
 
         else
             render json: @event.errors, status: :unprocessable_entity
         end
 
     end
 
     def destroy
         if @event.destroy
             render json: nil, status: :ok
         else
             render json: @event.errors, status: :unprocessable_entity
         end
 
     end


     def join
        event=Event.find(params[:event_id])
     #    check if current user is event creator
        return render json: {error: "You cant join you own event."}, status: :unprocessable_entity if event.user.id == 
        @current_user.id
 
     #    check if the event is full
        #    return render json: {error: "event is full."}, status: :unprocessable_entity if event.participants.count >=event.guests
 
    # check if the current user is already a participant
    return render json: {error: "You are already a participant."}, status: :unprocessable_entity if event.participants.include? (@current_user)
 
     event.participants << @current_user
     
     head :ok
    end


    def leave
        event=Event.find(params[:event_id])
  
        event.participants.delete(@current_user)

  
        head :ok
      end




 
     private

 
 
     def set_event
         @event=Event.find(params[:id])
 
     end
 
     def event_params
         params.permit(:content, :start_date_time, :end_date_time, :title, :cover_image)
     end


    #  def some_method
    #     event = Event.find(params[:id])
    #     username = event.user.username
    #     # Now you have access to the username associated with the event's user
    #   end
 end
 
