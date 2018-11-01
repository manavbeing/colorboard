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
  
  def board_coloring
    params.require(:tiles).permit(:color_code)
    params[:blocks].split(",").each do |bl|
      position = bl.split("-")[1].split("_")
      @user.boards.create(color: params[:color_code],row: position[0],column: position[1])
    end
respond_to :js
  end  
  
   def refresh_tiles
    respond_to :js
  end
  
     def index
          
     end
  
  end

