module LastFm
  
  VERSION = '0.1'
  API_URL = 'http://ws.audioscrobbler.com/2.0/'
  
  # the preferred way to set your audioscrobbler
  # api key is by setting the LastFm::API_KEY
  # constant, but I needed a safe way to call this
  # that would not cause problems if you choose not
  # to, so this little helper method was created
  def self.API_KEY
    API_KEY
  rescue
    nil
  end
  
  # purely in the interest of completeness.
  # you should still probably use LastFm::API_KEY=
  # for the sake of clarity
  def self.API_KEY=(value)
    const_set('API_KEY', value)
  end
  
  def self.api_call(method, arguments = {})
    url = API_URL + "?method=#{method}"
     url << "&api_key=#{API_KEY}" if constant_defined? API_KEY and !arguments.has_key? :api_key
    arguments.each_pair {|key, val| url << "&#{key}=#{val}"}
    ret = ''
    open(url){|x| ret = x.read}
    ret
  end
  
  require 'last.fm/user'
  require 'last.fm/track'

end

# Woah, twist here!
# allows the following syntax:
# Last.fm::API_KEY = ...
# and
# Last.fm::User.new('me')
# Why? I Honestly do not know.
module Last
  def self.fm
    LastFm
  end
end