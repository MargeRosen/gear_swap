class Permission < ActiveRecord::Base
  attr_accessible :user, :action, :thing
end
