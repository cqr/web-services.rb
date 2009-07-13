module Tumblr
  module Tumbl
    class Conversation
      
      attr_accessor :text, :title, :lines
      
      def initialize(opts = {})
        @text, @lines, @title = opts[:text], opts[:lines], opts[:title]
      end
      
    end
  end
end