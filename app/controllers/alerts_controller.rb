class AlertsController < ApplicationController
    before_action :set_alert, only:[:update, :destroy, :show]
    # before_action :authenticate_request, only: [:index, :show, :update, :destroy]
    # fixed issue but may have to look into this
    before_action :authenticate_request, only: [:create]
      
    def index
      # alerts=Alert.all
      # render json:alerts, status: :ok
      alerts=Alert.order(created_at: :desc).page(params[:page]).per(20)

      render json:{
       alerts: AlertBlueprint.render_as_hash(alerts, view: :long),
       total_pages: alerts.total_pages,
       current_page: alerts.current_page
    }
    end
    
    def show
    #  render json: @alert, status: :ok
    render json:AlertBlueprint.render_as_hash(@alert, view: :long), status: :ok
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
        params.permit(:content, :title)
      end
end
