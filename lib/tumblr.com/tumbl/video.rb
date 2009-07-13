module Tumblr
  module Tumbl
    class Video
      
      attr_accessor :caption, :source, :player
      
      def initialize(opts = {})
        @caption, @source, @player = opts[:caption],
                        opts[:source], opts[:player]
      end
      
    end
  end
end