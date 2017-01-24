class Room < ApplicationRecord

  validates_presence_of :title, :location, :description
  validates_length_of :description, minimum:3, allow_blanck:false

  def complete_name
    "#{title}, #{location}"
  end

end
