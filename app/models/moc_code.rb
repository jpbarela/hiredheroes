class MocCode < ActiveRecord::Base
  attr_accessible :moc_code, :name 
  has_many :keywords
  
  def moc_code_description
    return self.moc_code + " - " + self.name
  end 
  
end
