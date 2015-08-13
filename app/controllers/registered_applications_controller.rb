class RegisteredController < Registered_applicationController
  def index
    @registered_applications = Registered_application.all
  end

  def show
    @registered_application = Registered_application.find(params[:id])
  end

  def new
    @registered_application = Registered_application.new
  end

  def edit
    @registered_application = Registered_application.find(params[:id])
  end

  def create
    @registered_application = Registered_application.new(params.require(:applications).permit(:name,:url))
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
    @registered_application = Registered_application.find(params[:id])

    if @registered_application.destroy
      flash[:notice] = "application was removed."
    else
      flash[:notice] = "application couldn't be deleted. Try again"
    end
    redirect_to registered_applications_path
  end
end
