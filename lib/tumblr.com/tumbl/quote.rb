module Tumblr
  module Tumbl
    class Quote
      
      attr_accessor :text, :source
      
      def initialize(opts = {})
        @text, @source = opts[:text], opts[:source]
      end
      
    end
  end
end