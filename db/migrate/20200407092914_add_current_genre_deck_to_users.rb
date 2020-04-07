class AddCurrentGenreDeckToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :current_genre_deck, :string, default: ""
  end
end
