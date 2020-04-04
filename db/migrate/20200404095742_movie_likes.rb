class MovieLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_likes do |t|

      # movies foreign_key
      t.references :movie, foreign_key: true

      # users foreign_key
      t.references :user, foreign_key: true
      
      t.timestamps
    end 
  end
end
