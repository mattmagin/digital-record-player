class CreatePhysicalTags < ActiveRecord::Migration[8.0]
  def change
    create_table :physical_tags do |t|
      t.string :tag_code
      t.integer :identifier
      t.references :spotify_record, null: false, foreign_key: true

      t.timestamps
    end
  end
end
