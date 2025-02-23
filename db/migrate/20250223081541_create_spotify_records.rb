class CreateSpotifyRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :spotify_records do |t|
      t.string :uri
      t.string :record_type

      t.timestamps
    end
  end
end
