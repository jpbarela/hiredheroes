class Keyword < ActiveRecord::Base
  belongs_to :moc_code

  attr_accessible :keyword
end
