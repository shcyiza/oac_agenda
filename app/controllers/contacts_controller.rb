class ContactsController < ApplicationController
  #the controller where the mailform is setup
  def new
    @contact = Contact.new
    if user_signed_in?
      @user = current_user
    end
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
        redirect_to root_path, notice: "Toute la communauté vous remercie pour vôtre contribution"
    else
      flash.now[:error] = "Oops, il doit y avoir une erreur..."
      render :new
    end
  end

end
