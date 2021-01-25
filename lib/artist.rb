require "pry"

class Artist

    attr_accessor :name
    @@all = []

    def initialize(name)
        self.name = name
        save
    end

    def save
        @@all << self
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def add_song(song)
        song.artist = self
    end

    def print_songs
        self.songs.each do |song|
            puts song.name
        end
    end

    def self.all
        @@all
    end

    def self.find_or_create_by_name(name)
        self.all.detect(-> {Artist.new(name)}) do |artist|
            artist.name == name
        end  
    end

end