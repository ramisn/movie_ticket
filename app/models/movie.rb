class Movie < ActiveRecord::Base
  
  # tracked owner: ->(controller, model) { controller && controller.current_user }
  attr_accessible :place, :showtime, :title, :image_url

  belongs_to :user

  def self.search(search)
  find(:all, :conditions => ['place LIKE ?', search])
  end
end
