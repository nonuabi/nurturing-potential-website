class ContactsController < ApplicationController
  before_action :set_contact, only: %i[edit]

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts or /contacts.json
  def create
    contact = Contact.new(contact_params)

    if contact.save
      ContactMailer.welcome_email.deliver_now
      redirect_to thank_you_path()
    else
      flash[:error] = "Contact was not created."
    end
  end

  def thanks
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :message)
    end
end
