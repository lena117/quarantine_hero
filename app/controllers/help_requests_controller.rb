class HelpRequestsController < ApplicationController

  skip_before_action(:force_user_sign_in, { :only => [:index] })

  def new
    @users = User.all.order({ :username => :asc })

    render({ :template => "help_requests/new_help_request.html.erb" })
  end 
  
  def index
    @help_requests = HelpRequest.all.order({ :created_at => :desc })

    render({ :template => "help_requests/index.html.erb" })
  end

  def show
    @users = User.all.order({ :username => :asc })
    the_id = params.fetch("path_id")
    @help_request = HelpRequest.where({:id => the_id }).at(0)

    render({ :template => "help_requests/show.html.erb" })
  end

  def create
    @help_request = HelpRequest.new
    @help_request.requester_id = params.fetch("query_requester_id")
    @help_request.title = params.fetch("query_title")
    @help_request.description = params.fetch("query_description")
    @help_request.date_begin = params.fetch("query_date_begin")
    @help_request.date_end = params.fetch("query_date_end")
    @help_request.location = params.fetch("query_location")

    if @help_request.valid?
      @help_request.save
      redirect_to("/help_requests", { :notice => "Help request created successfully." })
    else
      redirect_to("/help_requests", { :notice => "Help request failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @help_request = HelpRequest.where({ :id => the_id }).at(0)

    @help_request.requester_id = params.fetch("query_requester_id")
    @help_request.title = params.fetch("query_title")
    @help_request.description = params.fetch("query_description")
    @help_request.date_begin = params.fetch("query_date_begin")
    @help_request.date_end = params.fetch("query_date_end")
    @help_request.location = params.fetch("query_location")

    if @help_request.valid?
      @help_request.save
      redirect_to("/help_requests/#{@help_request.id}", { :notice => "Help request updated successfully."} )
    else
      redirect_to("/help_requests/#{@help_request.id}", { :alert => "Help request failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @help_request = HelpRequest.where({ :id => the_id }).at(0)

    @help_request.destroy

    redirect_to("/help_requests", { :notice => "Help request deleted successfully."} )
  end
end
