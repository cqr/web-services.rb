require 'rubygems'
require 'nokogiri'

module Tumblr
  class Tumblr::User
    
    attr_reader :username
    
    def initialize(username)
      @username = username
    end
    
    def recent_tumbls
      @tumbls ||= recent_tumbls_xml.xpath('/tumblr/posts/post').map do |tumbl|
        case (tumbl/:'@type').text
        when 'regular'
          Tumblr::Tumbl::Regular.new(
            :title   => (tumbl/:'regular-title').inner_text,
            :body    => (tumbl/:'regular-body').inner_text
          )
        when 'link'
          Tumblr::Tumbl::Link.new(
            :text    => (tumbl/:'link-text').inner_text,
            :url     => (tumbl/:'link-url').inner_text
          )
        when 'quote'
          Tumblr::Tumbl::Quote.new(
            :text    => (tumbl/:'quote-text').inner_text,
            :source  => (tumbl/:'quote-source').inner_text
          )
        when 'photo'
          Tumblr::Tumbl::Photo.new(
            :caption => (tumbl/:'photo-caption').inner_text,
            :url     => (tumbl/:'photo-url[1]').inner_text
          )
        when 'conversation'
          Tumblr::Tumbl::Conversation.new(
            :title   => (tumbl/:'conversation-title').inner_text,
            :text    => (tumbl/:'conversation-text').inner_text,
            :lines   => tumbl.xpath('/conversation/line').map do |line|
              { :name  => (line/:'@name').text,
                :label => (line/:'@label').text,
                :text  => line.inner_text
              }
            end
          )
        when 'video'
          Tumblr::Tumbl::Video.new(
            :caption => (tumbl/:'video-caption').inner_text,
            :source  => (tumbl/:'video-source').inner_text,
            :player  => (tumbl/:'video-player').inner_text
          )
        when 'audio'
          Tumblr::Tumbl::Audio.new(
            :caption => (tumbl/:'audio-caption').inner_text,
            :player  => (tumbl/:'audio-player').inner_text
          )
        else
          nil
        end
      end
    end
    
    private
    
    def recent_tumbls_xml
      @rtx ||= Nokogiri::XML.parse(
          Tumblr.api_call(@username, 'read')
      )
    end
  end
end