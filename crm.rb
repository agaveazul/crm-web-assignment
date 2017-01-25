# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.

require_relative 'contact'
require 'sinatra'

Contact.create("Mark", "Zuckerberg", "mark@facebook.com", "CEO")

get "/" do
  @crm_app_name = "Richard's CRM"
  erb :index
end

get "/contacts/1/" do
  @contact = Contact.find(1)
  erb :show_contact
end

get "/contacts/" do
  @num_contacts = Contact.all.count
  erb :contacts
end

get "/contacts/new" do
  erb :new_contact
end

post "/contacts/" do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to("/")
end
