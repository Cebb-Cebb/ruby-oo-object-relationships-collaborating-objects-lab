require 'pry'
class Artist

    attr_accessor :name, :song 

    @@all = []

    def initialize(name)
        self.name = name 
        self.class.all << self
        @songs = []
    end 

    def self.all
        @@all 
    end 

    def songs
      Song.all.select do |song|
        if  song.artist == self
            @songs << song 
        end 
      end
      @songs 
    end 
            

    def add_song(song)
        @songs << song 
        # song.artist = self
    end 


    # def save
    #     self.class.all << self
    # end


    # def self.create 
    #     song = new 
    #     song.save
    # end 

    # def self.create_by_name(name)
    #     song = new(name)
    #     song.save 
    # end 

    
    def self.find_or_create_by_name(name)
        # binding.pry 
      self.all.detect {|artist| artist.name == name} || self.new(name)    
    end 

    def print_songs
        @songs.each do |song|
            puts song.name 
        end 
    end 
    


    
end 