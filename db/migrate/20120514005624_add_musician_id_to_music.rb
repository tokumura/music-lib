class AddMusicianIdToMusic < ActiveRecord::Migration
  def self.up
    add_column :musics, :musician_id, :integer
  end

  def self.down
    remove_column :musics, :musician_id
  end
end
