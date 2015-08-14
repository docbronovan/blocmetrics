class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
 
  def create
    @event = Event.new
    if RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN']) == nil
      render json: "Unregistered application", status: :unprocessable_entity
    else
      @registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
    
      @event = request.env[event_params]

      if @event == nil #failure
        render @event.errors, status: :unprocessable_entity
      else #success
        render json: @event, status: :created
      
      end
    end
  end
  before_filter :set_access_control_headers

  def set_access_control_headers
    # At #1, we allow requests from any origin.
    headers['Access-Control-Allow-Origin'] = '*'
    #2, we permit the POST, GET, OPTIONS request methods.
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    #3, we allow the header Content-Type, which is used in HTTP requests to declare the type of the data being sent.
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

  private

  def event_params
    params.permit(:name)
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
