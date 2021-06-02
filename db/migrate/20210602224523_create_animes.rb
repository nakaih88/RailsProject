class CreateAnimes < ActiveRecord::Migration[6.0]
  def change
    create_table :animes do |t|
      t.string :name 
      t.string :episode_length
      t.string :main_character
      t.integer :user_id
      t.integer :genre_id  


      t.timestamps
    end
  end
end
