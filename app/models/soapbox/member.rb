# "extend" adds methods from a module into a class as class methods.
# "include" adds methods from a module into a class as instance methods.
module Soapbox
  module Member
    def self.included(base)
      base.send :extend, ClassMethods
      base.send :include, InstanceMethods
      # base.has_attachment :avatar, :styles => {:large => "500X500>", :thumb => "200x200#"}
    end
 
    module ClassMethods
    end
 
    module InstanceMethods
    end
  end
end