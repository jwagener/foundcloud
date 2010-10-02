class Tag < ActiveRecord::Base
  
  has_many :users, :order => 'position ASC'
  
  validates_uniqueness_of :permalink
  
  before_create :generate_permalink
  
  def generate_permalink
    self.permalink = self.name.downcase.gsub(/[^a-zA-Z0-9]/, '-')
  end
  
end
