class MP3Importer

attr_accessor :path

    def initialize(path)
        self.path = path
    end

    def files
        d = Dir.new(self.path)
        d.children
    end

    def import
        self.files.each do |file|
            Song.new_by_filename(file)            
        end
    end

end