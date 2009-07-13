web-services.rb
===============

*a small collection of web service apis*

These are read only. They are being hacked together as both an exercise
in xml parsing with nokogiri and as a part of a project I am working on
in the closet.

So far, all we have is last.fm recent tracks and tumblr.com recent posts.

    reqire 'last.fm'
    require 'pp'
    
    Last.fm::API_KEY = 'your last.fm api key'
    pp Last.fm::User.new('lithite').recent_tracks
    
    require 'tumblr.com'
    
    pp Tumblr.com::User.new('chrisrhoden').recent_tumbls