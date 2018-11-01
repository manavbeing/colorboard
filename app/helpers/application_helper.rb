module ApplicationHelper
    def get_block_details(row,col)
    Board.find_color_user_stamp(row,col)
  end

  def create_board(row,col)
    block_info = get_block_details(row,col)
    raw("<div onclick='Changeclass(this);' class='content' 
         id='tile-#{row}_#{col}' #{style_attributes(block_info)}></div>")
  end

  def style_attributes(tile_info)
    "style='background-color: #{tile_info[0]}' title='#{tile_info[1]}'"
  end

end
