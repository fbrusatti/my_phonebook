class ContactsController < ApplicationController
  def index
    @contacts = Contact.all.paginate(:per_page => 5, :page => params[:page])
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      redirect_to @contact, :notice => "New contact created."
    else
      render :action => 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      redirect_to @contact, :notice  => "Contact updated."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_url, :notice => "Contact destroyed."
  end

  def search
    @contacts = Contact.search(params[:query], params[:column])
  end
end
