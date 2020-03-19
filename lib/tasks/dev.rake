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
      CommentHelpOffer.delete_all
      CommentHelpRequest.delete_all
    

      users = [
        {id: 1, username: "Steve", email: "steve@test.com", created_at: "2015-01-19 09:24:34", updated_at: "2019-10-08 10:25:00"},
        {id: 2, username: "Lauren", email: "lauren@test.com", created_at: "2015-01-19 09:24:34", updated_at: "2019-10-08 10:25:00"},
        {id: 3, username: "Tom", email: "tom@test.com", created_at: "2015-01-19 09:24:34", updated_at: "2019-10-08 10:25:00"},
        {id: 4, username: "Kate", email: "kate@test.com", created_at: "2015-01-19 09:24:34", updated_at: "2019-10-08 10:25:00"},
        {id: 5, username: "Mike", email: "mike@test.com", created_at: "2015-01-19 09:24:34", updated_at: "2019-10-08 10:25:00"},    
        {id: 6, username: "John", email: "john@test.com", created_at: "2015-01-19 09:24:34", updated_at: "2019-10-08 10:25:00"},
        {id: 7, username: "Mara", email: "mara@test.com", created_at: "2015-01-19 09:24:34", updated_at: "2019-10-08 10:25:00"},
        {id: 8, username: "Kaitlyn", email: "kaitlyn@test.com", created_at: "2015-01-19 09:24:34", updated_at: "2019-10-08 10:25:00"},
        {id: 9, username: "Allison", email: "allison@test.com", created_at: "2015-01-19 09:24:34", updated_at: "2019-10-08 10:25:00"},
        {id: 10, username: "Dave", email: "dave@test.com", created_at: "2015-01-19 09:24:34", updated_at: "2019-10-08 10:25:00"},  
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
        {id: 11, date_begin:"2020-04-02", date_end:"2020-04-12", description:"I can help people needing assistance in grocery shopping", title:"Help with shopping", location:"Chicago", offering_id: 1, created_at: "2020-03-17 09:24:34", updated_at: "2020-03-17 10:25:00"},
        {id: 12, date_begin:"2020-04-05", date_end:"2020-04-20", description:"I am a trained babysitter and can help out every Tuesday morning", title:"Babysitting", location:"New York", offering_id: 2, created_at: "2020-03-17 09:24:34", updated_at: "2020-03-17 10:25:00"},
        {id: 13, date_begin:"2020-04-02", date_end:"2020-04-12", description:"I am a teacher and can provide virtual classes to kids grades 4-6", title:"Teaching online", location:"Virtual", offering_id: 3, created_at: "2020-03-10 09:24:34", updated_at: "2020-03-11 10:25:00"},
        {id: 14, date_begin:"2020-04-05", date_end:"2020-04-20", description:"I am a student and can assist in multiple areas, like shopping, babysitting or some minor teaching", title:"Multiple options", location:"Los Angeles", offering_id: 4, created_at: "2020-03-17 09:24:34", updated_at: "2020-03-17 10:25:00"},
        {id: 15, date_begin:"2020-04-09", date_end:"2020-04-12", description:"Anyone need some assistance in daily errands? I can help out anyone who needs assistance in shopping or other smaller tasks.", title:"Everyday assistance", location:"Chicago", offering_id: 5, created_at: "2020-03-14 09:24:34", updated_at: "2020-03-17 10:25:00"},
        {id: 16, date_begin:"2020-04-10", date_end:"2020-04-20", description:"I am a trained nanny located in Miami and would be free every Wednesday and Thursday to help parents in need.", title:"Nannying in Miami", location:"Miami", offering_id: 6, created_at: "2020-03-18 09:24:34", updated_at: "2020-03-18 10:25:00"},

      ]
      HelpOffer.insert_all!(help_offers)

        comment_help_offers = [
        {id: 31, body:"I would really appreciate some help with shopping for me any my three kids. I live in South Loop. Feel free to call/text me on: 312-123-1234", author_id: 2, help_offer_id: 11, created_at: "2020-03-18 11:00:00", updated_at: "2020-03-18 11:00:00"},
        {id: 32, body:"I am really interested! Can you please send me an e-mail? this is my address: tom@test.com", author_id: 3, help_offer_id: 12, created_at: "2020-03-19 11:00:00", updated_at: "2020-03-19 11:00:00"},
        {id: 33, body:"My kids are in 4th and 5th grade and some online teaching would be really helpful, I'm very interested. Here is my phone number: 312-456-4567", author_id: 4, help_offer_id: 13, created_at: "2020-03-12 11:00:00", updated_at: "2020-03-12 11:00:00"},
        {id: 34, body:"Your offer sounds great! Both my wife and I have to work full-time and could really need some help with our little kids (4 and 7), as their school/daycare is currently canceled. pleae e-mail me on: mike@test.com", author_id: 5, help_offer_id: 14, created_at: "2020-03-18 11:00:00", updated_at: "2020-03-18 11:00:00"},
        {id: 35, body:"My grandparents live in the area and could really need some help, as they are not allowed to leave their house right now. Please call me on 312-678-6789", author_id: 6, help_offer_id: 15, created_at: "2020-03-18 11:00:00", updated_at: "2020-03-18 11:00:00"},
        {id: 36, body:"That sounds great! I could really need some help on those days! Please text me on: 312.123.1234 ", author_id: 7, help_offer_id: 16, created_at: "2020-03-19 11:00:00", updated_at: "2020-03-19 11:00:00"},

      ]
      CommentHelpOffer.insert_all!(comment_help_offers)

        help_requests = [
        {id: 21, date_begin:"2020-04-02", date_end:"2020-04-12", description:"I need someone to help my grandsparents do their groceries twice a week", title: "Need help with shopping", location:"Chicago", requester_id: 2, created_at: "2020-03-17 09:24:34", updated_at: "2020-03-17 10:25:00"},
        {id: 22, date_begin:"2020-04-05", date_end:"2020-04-20", description:"My husband is sick and I work in the hospital and urgently need someone to help watch my two kids", title: "Need a nanny", location:"Los Angeles", requester_id: 2, created_at: "2020-03-17 09:24:34", updated_at: "2020-03-17 10:25:00"},
        {id: 23, date_begin:"2020-04-07", date_end:"2020-04-18", description:"I am currently in quarantine at home but urgently need to get some medication, can someone help?", title: "Need help going to pharmacy", location:"New York", requester_id: 7, created_at: "2020-03-10 09:24:34", updated_at: "2020-03-11 10:25:00"},
        {id: 24, date_begin:"2020-04-01", date_end:"2020-04-30", description:"My family and I need to stay at home for the next two weeks and would need some help in getting basic groceries.", title: "Help with groceries", location:"Dallas", requester_id: 8, created_at: "2020-03-17 09:24:34", updated_at: "2020-03-18 10:25:00"},
        {id: 25, date_begin:"2020-04-12", date_end:"2020-04-24", description:"My kids' school is closed but my partner and I need to work (hospital), therefore we are looking for someone to watch our kids, times are flexible.", title: "Need a babysitter", location:"Chicago", requester_id: 9, created_at: "2020-03-14 09:24:34", updated_at: "2020-03-17 10:25:00"},
        {id: 26, date_begin:"2020-04-10", date_end:"2020-04-28", description:"I have to stay at home and cannot walk my dog. I would really appreciate if someone (living close by), would be willing to take my dog for a walk at least once a day.", title: "Need someone to walk my dog", location:"New York", requester_id: 10, created_at: "2020-03-18 09:24:34", updated_at: "2020-03-18 10:25:00"},
      ]
      HelpRequest.insert_all!(help_requests)

       comment_help_requests = [
        {id: 41, body:"Would love to help! feel free to text on: 312-123-4352", author_id: 1, help_request_id: 21, created_at: "2020-03-18 11:00:00", updated_at: "2020-03-18 11:00:00"},
        {id: 42, body:"I would be able to help during the week/in the afternoon. Feel free to reach out to me (kaitlyn@test.com)", author_id: 8, help_request_id: 22, created_at: "2020-03-19 11:00:00", updated_at: "2020-03-19 11:00:00"},
        {id: 43, body:"Until when exactly do you need your medication? I am free most of the days and have to leave the house anyways. Give me a call on 312-567-5675", author_id: 9, help_request_id: 23, created_at: "2020-03-12 11:00:00", updated_at: "2020-03-12 11:00:00"},
        {id: 44, body:"I can help! Feel free to call: 312-567-3452", author_id: 10, help_request_id: 24, created_at: "2020-03-18 11:00:00", updated_at: "2020-03-18 11:00:00"},
        {id: 45, body:"Hey! I am a trained nanny and would love to help you out. I'm free most days (except Tuesday and Sunday). Feel free to text: 312-980-5674", author_id: 6, help_request_id: 25, created_at: "2020-03-18 11:00:00", updated_at: "2020-03-18 11:00:00"},
        {id: 46, body:"I love dogs! Where do you live exactly? I can help out at least once a day. Feel free to call: 312-342-1231", author_id: 7, help_request_id: 26, created_at: "2020-03-19 11:00:00", updated_at: "2020-03-19 11:00:00"},

      ]
      CommentHelpRequest.insert_all!(comment_help_requests)

    
     
      ending = Time.now
      elapsed = ending - starting

      puts "#{elapsed.to_i} seconds elapsed."
      puts "Generated Dummy Data"
    end
  end

