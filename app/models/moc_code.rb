class MocCode < ActiveRecord::Base
  attr_accessible :moc_code, :name 
  
  def moc_code_description
    return self.moc_code + " - " + self.name
  end 
  
end
