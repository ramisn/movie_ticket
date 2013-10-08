class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :image_url
      t.time :showtime
      t.string :place
      t.belongs_to :user

      t.timestamps
    end
    
  end
end
