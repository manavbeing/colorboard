class Board < ApplicationRecord
    belongs_to :user
    validates_presence_of :color,:row,:column,:user_id
    
     def self.find_color_user_stamp(x,y)
    result = []
    board = Board.where(row: x,column: y).last
    result = [board.code,"#{board.user.username} #{board.cal_tstamp}"] if board.present?
    result
  end
 def cal_tstamp
    self.updated_at.strftime("%d-%m-%Y %H:%M:%S")
  end
end
