module Tumblr
  module Tumbl
    def self.new(type, *args)
      const_get('Tumblr::Tumbl::'+type.capitalize).new(*args)
    end
    require 'tumblr.com/tumbl/regular'
    require 'tumblr.com/tumbl/link'
    require 'tumblr.com/tumbl/quote'
    require 'tumblr.com/tumbl/photo'
    require 'tumblr.com/tumbl/conversation'
    require 'tumblr.com/tumbl/video'
    require 'tumblr.com/tumbl/audio'
  end
end