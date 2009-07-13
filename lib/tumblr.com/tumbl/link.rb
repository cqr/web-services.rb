module Tumblr
  module Tumbl
    class Link
      
      attr_accessor :text, :url
      
      def initialize(opts = {})
        @text, @url = opts[:text], opts[:url]
      end
      
    end
  end
end