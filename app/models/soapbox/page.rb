# "extend" adds methods from a module into a class as class methods.
# "include" adds methods from a module into a class as instance methods.
module Soapbox
  module Page
    def self.included(base)
      base.send :extend, ClassMethods
      base.send :include, InstanceMethods
      # base.has_attachment :primary_image, :styles => {:large => "727x300#", :thumb => "200x100#"}
      # base.has_attachment :background_image, :styles => {:large => "1500x1500>", :thumb => "150x150>"}
    end
    
    module ClassMethods
    end
    
    module InstanceMethods
    end
  end
end