Rails.application.routes.draw do

get("/", { :controller => "application", :action => "hello" })

  # Routes for the Comment help offer resource:

  # CREATE
  post("/insert_comment_help_offer", { :controller => "comment_help_offers", :action => "create" })
          
  # READ
  get("/comment_help_offers", { :controller => "comment_help_offers", :action => "index" })
  
  get("/comment_help_offers/:path_id", { :controller => "comment_help_offers", :action => "show" })
  
  # UPDATE
  
  post("/modify_comment_help_offer/:path_id", { :controller => "comment_help_offers", :action => "update" })
  
  # DELETE
  get("/delete_comment_help_offer/:path_id", { :controller => "comment_help_offers", :action => "destroy" })

  #------------------------------

  # Routes for the Comment help request resource:

  # CREATE
  post("/insert_comment_help_request", { :controller => "comment_help_requests", :action => "create" })
          
  # READ
  get("/comment_help_requests", { :controller => "comment_help_requests", :action => "index" })
  
  get("/comment_help_requests/:path_id", { :controller => "comment_help_requests", :action => "index" })
  
  # UPDATE
  
  post("/modify_comment_help_request/:path_id", { :controller => "comment_help_requests", :action => "update" })
  
  # DELETE
  get("/delete_comment_help_request/:path_id", { :controller => "comment_help_requests", :action => "destroy" })

  #------------------------------

  # Routes for the Help request resource:
  
  # new

  get("/new_help_request", { :controller => "help_requests", :action => "new"})

  # CREATE
  post("/insert_help_request", { :controller => "help_requests", :action => "create" })
          
  # READ
  get("/help_requests", { :controller => "help_requests", :action => "index" })
  
  get("/help_requests/:path_id", { :controller => "help_requests", :action => "show" })
  
  # UPDATE
  
  post("/modify_help_request/:path_id", { :controller => "help_requests", :action => "update" })
  
  # DELETE
  get("/delete_help_request/:path_id", { :controller => "help_requests", :action => "destroy" })

  #------------------------------

  # Routes for the Help offer resource:

  # new

  get("/new_help_offer", { :controller => "help_offers", :action => "new"})

  # CREATE
  post("/insert_help_offer", { :controller => "help_offers", :action => "create" })
          
  # READ
  get("/help_offers", { :controller => "help_offers", :action => "index" })
  
  get("/help_offers/:path_id", { :controller => "help_offers", :action => "show" })
  
  # UPDATE
  
  post("/modify_help_offer/:path_id", { :controller => "help_offers", :action => "update" })
  
  # DELETE
  get("/delete_help_offer/:path_id", { :controller => "help_offers", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # details user
  get("/users/:user_username", { :controller => "users", :action => "details" })    

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "users", :action => "new_registration_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "users", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "users", :action => "edit_registration_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "users", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "users", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_sessions", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_sessions", :action => "destroy_cookies" })
             
  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
