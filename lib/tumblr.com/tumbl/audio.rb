module Tumblr
  module Tumbl
    class Audio
      
      attr_accessor :caption, :player
      
      def initialize(opts = {})
        @caption, @player = opts[:caption], opts[:player]
      end
      
    end
  end
end