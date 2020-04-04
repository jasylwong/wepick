class AddMovieCounterToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :movie_counter, :integer, default: 0
  end
end
