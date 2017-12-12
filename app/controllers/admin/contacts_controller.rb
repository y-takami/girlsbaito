class Admin::ContactsController < Admin::Base

  def index
    @contacts = Contact.all.page(params[:page])
  end

  def show
    @contact = Contact.find(params[:id])
  end


end
