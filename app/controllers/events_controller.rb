class EventsController < ApplicationController
   
    
    # before_action :authenticate_request, except: [:index] 
    before_action :set_event, only:[:update, :destroy, :show]
    ##this was before if i need to revert down below...i changed to auth_request
    # before_action :authenticate_request, except: [:index, :show]
    # before_action :authenticate_request

    

    

    
     
     def index
        
        events = Event.with_same_zipcode_as_user(@current_user).order(created_at: :desc).page(params[:page]).per(21)
        

      
        
        #  events=Event.order(created_at: :desc).page(params[:page]).per(21)

        render json:{
         events: EventBlueprint.render_as_hash(events, view: :short),
         total_pages: events.total_pages,
         current_page: events.current_page
        }



 
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


  
 end
 
