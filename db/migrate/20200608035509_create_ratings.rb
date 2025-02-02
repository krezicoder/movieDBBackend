class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.belongs_to :movie, null: false, foreign_key: true
      t.belongs_to :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
