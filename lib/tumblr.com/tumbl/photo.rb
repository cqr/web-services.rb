module Tumblr
  module Tumbl
    class Photo
      
      attr_accessor :caption, :url
      
      def initialize(opts = {})
        @caption, @url = opts[:caption], opts[:url]
      end
      
    end
  end
end