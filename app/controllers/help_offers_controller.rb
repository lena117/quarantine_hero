class HelpOffersController < ApplicationController

  skip_before_action(:force_user_sign_in, { :only => [:index] })

  def new
    @users = User.all.order({ :username => :asc })

    render({ :template => "help_offers/new_help_offer.html.erb" })
  end 
  def index
    @help_offers = HelpOffer.all.order({ :created_at => :desc })

    render({ :template => "help_offers/index.html.erb" })
  end

  def show

    @users = User.all.order({ :username => :asc })
    
    the_id = params.fetch("path_id")
    @help_offer = HelpOffer.where({:id => the_id }).at(0)

    render({ :template => "help_offers/show.html.erb" })
  end

  def create
    @help_offer = HelpOffer.new
    @help_offer.offering_id = params.fetch("query_offering_id")
    @help_offer.title = params.fetch("query_title")
    @help_offer.description = params.fetch("query_description")
    @help_offer.date_begin = params.fetch("query_date_begin")
    @help_offer.date_end = params.fetch("query_date_end")
    @help_offer.location = params.fetch("query_location")

    if @help_offer.valid?
      @help_offer.save
      redirect_to("/help_offers", { :notice => "Help offer created successfully." })
    else
      redirect_to("/help_offers", { :notice => "Help offer failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @help_offer = HelpOffer.where({ :id => the_id }).at(0)

    @help_offer.offering_id = params.fetch("query_offering_id")
    @help_offer.title = params.fetch("query_title")
    @help_offer.description = params.fetch("query_description")
    @help_offer.date_begin = params.fetch("query_date_begin")
    @help_offer.date_end = params.fetch("query_date_end")
    @help_offer.location = params.fetch("query_location")

    if @help_offer.valid?
      @help_offer.save
      redirect_to("/help_offers/#{@help_offer.id}", { :notice => "Help offer updated successfully."} )
    else
      redirect_to("/help_offers/#{@help_offer.id}", { :alert => "Help offer failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @help_offer = HelpOffer.where({ :id => the_id }).at(0)

    @help_offer.destroy

    redirect_to("/help_offers", { :notice => "Help offer deleted successfully."} )
  end
end
