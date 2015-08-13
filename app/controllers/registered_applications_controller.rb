class RegisteredApplicationsController < ApplicationController
  def index
    @registered_applications = RegisteredApplication.all
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    if @registered_application.update_attributes(params.require(:registered_application).permit(:name,:url))
       flash[:notice] = "App was updated."
       redirect_to @registered_application
     else
       flash[:error] = "There was an error saving the app. Please try again."
       render :edit
     end
  end

  def create
    @registered_application = RegisteredApplication.new(params.require(:registered_application).permit(:name,:url))
    @registered_application.user_id = current_user.id
    #@registered_applications = current_user.registered_applications.new(params.require(:registered_applications).permit(:name,:url))
    
    if @registered_application.save
      flash[:notice] = "application was saved."
      redirect_to @registered_application
    else
      flash[:error] = "There was an error saving the application. Please try again."
      render :new
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])

    if @registered_application.destroy
      flash[:notice] = "application was removed."
    else
      flash[:notice] = "application couldn't be deleted. Try again"
    end
    redirect_to registered_applications_path
  end
end
