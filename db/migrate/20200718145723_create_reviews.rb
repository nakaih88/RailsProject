class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :title
      t.string :content
      t.integer :anime_id
      t.integer :user_id

      t.timestamps
    end
  end
end
