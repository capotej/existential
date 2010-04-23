module Existential
  def self.included(base)
    base.send :extend, ClassMethods
  end
  
  module ClassMethods
    def is_existential
      send :include, InstanceMethods
    end
  end
  
  module InstanceMethods
    def can?(action, resource)
      meth = "allows_" << action.to_s << "_for?"
      resource.send(meth.to_sym, self)
    end
  end
end

ActiveRecord::Base.send :include, Existential
