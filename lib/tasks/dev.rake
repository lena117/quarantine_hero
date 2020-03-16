namespace(:dev) do
  desc "Fill the database tables with some dummy data"
    task({ :prime => :environment}) do
      starting = Time.now

      if Rails.env.production?
        ActiveRecord::Base.connection.tables.each do |t|
          ActiveRecord::Base.connection.reset_pk_sequence!(t)
        end
      end

      User.delete_all
      HelpRequest.delete_all
      HelpOffer.delete_all
    

      users = [
        {id: 1, username: "Steve", email: "steve@test.com", created_at: "2015-01-19 09:24:34", updated_at: "2019-10-08 10:25:00"},
        {id: 2, username: "Lauren", email: "lauren@test.com", created_at: "2015-01-19 09:24:34", updated_at: "2019-10-08 10:25:00"},
        {id: 3, username: "Tom", email: "tom@test.com", created_at: "2015-01-19 09:24:34", updated_at: "2019-10-08 10:25:00"},
        {id: 4, username: "Kate", email: "kate@test.com", created_at: "2015-01-19 09:24:34", updated_at: "2019-10-08 10:25:00"},
        {id: 5, username: "Mike", email: "mike@test.com", created_at: "2015-01-19 09:24:34", updated_at: "2019-10-08 10:25:00"},     
      ]
      User.insert_all!(users)

      if User.method_defined?(:password) || User.has_attribute?(:password_digest)
        User.all.each do |user|
          user.password = "password"
          user.save
        end
        puts "Found a password column. Added passwords."
      else
        puts "No password column found. Didn't add passwords."
      end

         help_offers = [
        {id: 11, date_begin:"2020-04-02", date_end:"2020-04-12", description:"I can help people needing assistance in grocery shopping", title:"Help with shopping", location:"Chicago", offering_id: 1, created_at: "2015-01-19 09:24:34", updated_at: "2019-10-08 10:25:00"},
        {id: 12, date_begin:"2020-04-05", date_end:"2020-04-20", description:"I am a trained babysitter and can help out every Tuesday morning", title:"Babysitting", location:"New York", offering_id: 1, created_at: "2015-01-19 09:24:34", updated_at: "2019-10-08 10:25:00"},
      ]
      HelpOffer.insert_all!(help_offers)

        help_requests = [
        {id: 21, date_begin:"2020-04-02", date_end:"2020-04-12", description:"I need someone to help my grandsparents do their groceries twice a week", title: "Need help with shopping", location:"Chicago", requester_id: 2, created_at: "2015-01-19 09:24:34", updated_at: "2019-10-08 10:25:00"},
        {id: 22, date_begin:"2020-04-05", date_end:"2020-04-20", description:"My husband is sick and I work in the hospital and urgently need someone to help watch my two kids", title: "Need a nanny", location:"Los Angeles", requester_id: 2, created_at: "2015-01-19 09:24:34", updated_at: "2019-10-08 10:25:00"},
      ]
      HelpRequest.insert_all!(help_requests)
      
      

     
      ending = Time.now
      elapsed = ending - starting

      puts "#{elapsed.to_i} seconds elapsed."
      puts "Generated Dummy Data"
    end
  end

