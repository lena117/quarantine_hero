class CommentHelpRequestsController < ApplicationController
  def index
    @comment_help_requests = CommentHelpRequest.all.order({ :created_at => :desc })

    render({ :template => "comment_help_requests/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @comment_help_request = CommentHelpRequest.where({:id => the_id }).at(0)

    render({ :template => "comment_help_requests/show.html.erb" })
  end

  def create
    @comment_help_request = CommentHelpRequest.new
    @comment_help_request.author_id = params.fetch("query_author_id")
    @comment_help_request.help_request_id = params.fetch("query_help_request_id")
    @comment_help_request.body = params.fetch("query_body")

    if @comment_help_request.valid?
      @comment_help_request.save
      redirect_to("/comment_help_requests", { :notice => "Comment help request created successfully." })
    else
      redirect_to("/comment_help_requests", { :notice => "Comment help request failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @comment_help_request = CommentHelpRequest.where({ :id => the_id }).at(0)

    @comment_help_request.author_id = params.fetch("query_author_id")
    @comment_help_request.help_request_id = params.fetch("query_help_request_id")
    @comment_help_request.body = params.fetch("query_body")

    if @comment_help_request.valid?
      @comment_help_request.save
      redirect_to("/comment_help_requests/#{@comment_help_request.id}", { :notice => "Comment help request updated successfully."} )
    else
      redirect_to("/comment_help_requests/#{@comment_help_request.id}", { :alert => "Comment help request failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @comment_help_request = CommentHelpRequest.where({ :id => the_id }).at(0)

    @comment_help_request.destroy

    redirect_to("/comment_help_requests", { :notice => "Comment help request deleted successfully."} )
  end
end
