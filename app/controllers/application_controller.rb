class ApplicationController < ActionController::Base
  before_action(:load_current_user)
  
  before_action(:force_user_sign_in)

  skip_before_action(:force_user_sign_in, { :only => [:hello] })
  
  def load_current_user
    the_id = session.fetch(:user_id)
    @current_user = User.where({ :id => the_id }).at(0)
  end
  
  def force_user_sign_in
    if @current_user == nil
      redirect_to("/user_sign_in", { :notice => "You have to sign in first." })
    end
  end

  def hello 
    render({ :template => "hello.html.erb" })
  end 

end
