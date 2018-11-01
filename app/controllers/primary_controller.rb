class PrimaryController < ApplicationController
    
     before_action :assign_name
 
  def assign_name
    user = User.where(ip_add: request.remote_ip).last
    if user.present?
      @user = user
    else
      username = "CurrentUser#{User.count+1}-#{DateTime.now.to_i}"
      @user = User.create(username: username,ip_add: request.remote_ip)
    end
 
  end
  

     def index
          
  end
  
end

