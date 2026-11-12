class Api::V1::ContactsController < ApplicationController
    def index
        contacts = Contact.order(:name)
        render json: contacts
    end

    def show
        contact = Contact.find(params[:id])
        render json: contact
    end

    def create
      contact = Contact.new(contact_params)

      if contact.save
        render json: contact, status: :created
      else
        render json: contact.errors, status: :unprocessable_entity
      end
    end

    def update
      contact = Contact.find(params[:id])
      
      if contact.update(contact_params)
        render json: contact
      else
        render json: contact.errors, status: :unprocessable_entity
      end
    end

    def destroy
      contact = Contact.find(params[:id])

      contact.destroy
      head :no_content
    end

    private 
    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :notes, :favorite)
    end

end
