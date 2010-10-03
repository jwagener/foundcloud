require 'net/http'
require 'json'

class User < ActiveRecord::Base
  
  
  
  belongs_to :tag
  def update_infos
    sc_user = self.class.load_sc_user(permalink_url)
    update_attributes!(self.class.sc_user_to_hash(sc_user))
  end
  
  class << self
    def consumer_key_param
      "consumer_key=ABC"
    end
  
    def load_sc_user(url)
      location = Net::HTTP.get_response(URI.parse("http://api.soundcloud.com/resolve?format=json&url=#{url}&#{consumer_key_param}"))['location']
      JSON.parse(Net::HTTP.get(URI.parse(location)))
    end
  
    def from_url(url)
      user = load_sc_user(url)
      new(sc_user_to_hash(user))
    end
    
    def sc_user_to_hash(sc_user)
      {
        :username   => sc_user['username'],
        :permalink_url  => sc_user['permalink_url'],
        :sc_id      => sc_user['id'],
        :follower_count => sc_user['followers_count'],
        :avatar_url => sc_user['avatar_url'].gsub('large', 'badge'),
        :city      => sc_user['city'],
        :full_name  => sc_user['full_name'],
      }
    end
    
  end
end
