require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    newSong = self.new
    @@all << newSong
    newSong
  end

  def self.new_by_name(songName)
    newSong = self.new
    newSong.name = songName
    newSong
  end

  def self.create_by_name(songName)
    newSong = Song.new_by_name(songName)
    @@all << newSong
    newSong
  end

  def self.find_by_name(songName)
    @@all.find {|song| song.name == songName}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    file_data = file.split(/[.-]/).map{|section| section = section.strip}
    song = self.find_or_create_by_name(file_data[1])
    song.artist_name = file_data[0]
    song
  end

  def self.create_from_filename(file)
    newSong = Song.new_from_filename(file)
    @@all << newSong
  end

  def self.destroy_all
    @@all = []
  end
end

