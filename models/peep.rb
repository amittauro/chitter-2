class Peep < ActiveRecord::Base
  belongs_to :user

  def format_time
    time.to_formatted_s(:long_ordinal)
  end

  def self.reverse_order
    Peep.all.sort_by { |peep| peep.time }.reverse
  end

  def update_tags(user_id)
    if tags == nil
      new_tags = [user_id]
    else
      new_tags = tags.push(user_id)
    end
    update(tags: new_tags)
  end
end
