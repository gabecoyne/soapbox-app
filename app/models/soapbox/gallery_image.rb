# "extend" adds methods from a module into a class as class methods.
# "include" adds methods from a module into a class as instance methods.
module Soapbox
  module GalleryImage
    def self.included(base)
      base.send :extend, ClassMethods
      base.send :include, InstanceMethods
      # base.has_attachment :image, :styles => {:large => "1000X1000>", :header => "727X300#", :thumb => "200x200>", :thumb_square => "200x200#" }
    end
 
    module ClassMethods
    end
 
    module InstanceMethods
    end
  end
end