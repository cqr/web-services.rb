module Tumblr
  module Tumbl
    class Regular
      
      attr_accessor :title, :body
      
      def initialize(opts = {})
        @title, @body = opts[:title], opts[:body]
      end
      
    end
  end
end