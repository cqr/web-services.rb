require 'open-uri'
require 'nokogiri'
module LastFm
  class LastFm::User
    
    attr_accessor :api_key, :username
    
    def initialize(username, opts = {})
      @username = username
      @api_key = opts[:api_key] if opts[:api_key]
    end
    
    def recent_tracks
      @tracks ||= recent_tracks_xml.xpath('//track').map do |track|
        LastFm::Track.new(
            :name      => (track/:name).inner_text,
            :image_url => track.xpath('//image[@size="small"]').inner_text,
            :artist    => (track/:artist).inner_text,
            :album     => (track/:album).inner_text,
            :url       => (track/:url).inner_text
           )
      end
    end
    
    private
    
    def recent_tracks_xml
      @rtx ||= Nokogiri::XML.parse(
        LastFm.api_call(
                'user.getrecenttracks',
                :user    => @username,
                :api_key => api_key
              )
       )
    end
    
    def api_key
      @api_key || LastFm.API_KEY
    end
  end
end