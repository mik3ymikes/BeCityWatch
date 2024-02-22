class AlertsController < ApplicationController
    before_action :set_alert, only:[:update, :destroy, :show]
    # before_action :authenticate_request, only: [:index, :show, :update, :destroy]
    # fixed issue but may have to look into this
    before_action :authenticate_request, only: [:create]
      
    def index
      alerts=Alert.all
      render json:alerts, status: :ok
    end
    
    def show
     render json: @alert, status: :ok
    end
    
    def create
       alert=@current_user.alerts.new(alert_params)
    
       if alert.save
        render json: alert, status: :created
       else
        render json: alert.errors, status: :unprocessable_entity
       end
      end
    
      def update
        if @alert.update(alert_params)
          render json: @alert, status: :ok
        else
             render json: @alert.errors.full_messages, status: :unprocessable_entity
        end
      end
    
      def destroy
      if @alert.destroy
        render json: nil, status: :ok
      else
        render json: @alert.errors, status: :unprocessable_entity
      end
      end
    
    
      private
    
      def set_alert
        @alert=Alert.find(params[:id] )
      end
    
      def alert_params
        params.permit(:content)
      end
end
