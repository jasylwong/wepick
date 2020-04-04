class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :overview
      t.string :imdb_id 
      t.string :poster_path
      t.string :genre
      t.timestamps 
    end
  end
end
