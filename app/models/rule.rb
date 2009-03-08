class Rule < ActiveRecord::Base
  
  has_and_belongs_to_many :fighters

end
