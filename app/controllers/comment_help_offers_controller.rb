class CommentHelpOffersController < ApplicationController
  def index
    @comment_help_offers = CommentHelpOffer.all.order({ :created_at => :desc })

    render({ :template => "comment_help_offers/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @comment_help_offer = CommentHelpOffer.where({:id => the_id }).at(0)

    render({ :template => "comment_help_offers/show.html.erb" })
  end

  def create
    @comment_help_offer = CommentHelpOffer.new
    @comment_help_offer.author_id = params.fetch("query_author_id")
    @comment_help_offer.help_offer_id = params.fetch("query_help_offer_id")
    @comment_help_offer.body = params.fetch("query_body")

    if @comment_help_offer.valid?
      @comment_help_offer.save
      redirect_to("/comment_help_offers", { :notice => "Comment help offer created successfully." })
    else
      redirect_to("/comment_help_offers", { :notice => "Comment help offer failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @comment_help_offer = CommentHelpOffer.where({ :id => the_id }).at(0)

    @comment_help_offer.author_id = params.fetch("query_author_id")
    @comment_help_offer.help_offer_id = params.fetch("query_help_offer_id")
    @comment_help_offer.body = params.fetch("query_body")

    if @comment_help_offer.valid?
      @comment_help_offer.save
      redirect_to("/comment_help_offers/#{@comment_help_offer.id}", { :notice => "Comment help offer updated successfully."} )
    else
      redirect_to("/comment_help_offers/#{@comment_help_offer.id}", { :alert => "Comment help offer failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @comment_help_offer = CommentHelpOffer.where({ :id => the_id }).at(0)

    @comment_help_offer.destroy

    redirect_to("/comment_help_offers", { :notice => "Comment help offer deleted successfully."} )
  end
end
