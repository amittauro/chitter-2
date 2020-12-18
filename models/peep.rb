class Peep < ActiveRecord::Base
  belongs_to :user

  def format_time
    time.to_formatted_s(:long_ordinal)
  end
end
