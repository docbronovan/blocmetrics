class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
 
  def create
    @event = Event.new
    if RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN']) == nil
      render json: "Unregistered application", status: :unprocessable_entity
    else
      @registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
      
      @event.name = event_params['event_name']
      @event.registered_application = @registered_application
      
      if @event.save 
        render json: @event, status: :created #JSON-ify the provided data.
      else
        render @event.errors, status: :unprocessable_entity
      end
    end
  end

  private

  def event_params
    params.permit(:event_name)
  end  

  def permission_denied_error
    error(403, 'Permission Denied!')
  end

  def errors(status, message = 'Something went wrong')
    response = {
      response_type: "ERROR",
      message: message
    }

    render json: response.to_json, status: status
  end


end
