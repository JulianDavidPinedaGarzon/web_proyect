class CreateHashtags < ActiveRecord::Migration[8.0]
  def change
    create_table :hashtags do |t|
      t.string :name

      t.timestamps
    end
  end
end
