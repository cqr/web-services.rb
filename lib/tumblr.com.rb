require 'open-uri'

module Tumblr
  
  VERSION = '0.1'
  
  API_URL = 'http://%{user}.tumblr.com/api/'
  
  
  # What? Tumblr.com::User? Why?!
  def self.com
    self
  end
  
  def self.api_call(username, api_method, options = {})
    url = API_URL.sub('%{user}', username) + api_method
    xml = ''
    open(url){|readable| xml = readable.read }
    xml
  end
  
  require 'tumblr.com/user'
  require 'tumblr.com/tumbl'
end