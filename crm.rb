# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.

require_relative 'contact'
require 'sinatra'

Contact.create("Mark", "Zuckerberg", "mark@facebook.com", "CEO")
Contact.create("Rich", "Strauss", "rich@facebook.com", "VP")
Contact.create("Ben", "Rod", "ben@facebook.com", "VP")

get "/" do
  @crm_app_name = "Richard's CRM"
  erb :index
end

get "/contacts/:id/" do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
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

get "/contacts/:id/edit/" do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end
