class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :room
      t.integer :points

      t.index [:user_id, :room_id], unique: true

      t.timestamps
    end
  end
end
