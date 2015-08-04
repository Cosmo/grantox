module Grantox
  class ItemBlock
    include Mongoid::Document
    
    field :position, type: Integer
  end
end