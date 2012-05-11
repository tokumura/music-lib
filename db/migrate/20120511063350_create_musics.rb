class CreateMusics < ActiveRecord::Migration
  def self.up
    create_table :musics do |t|
      t.string :title
      t.string :musician
      t.date :release
      t.text :info

      t.timestamps
    end
  end

  def self.down
    drop_table :musics
  end
end
