class LineItem < ActiveRecord::Base
  
belongs_to :cakestore

belongs_to :cart

def total_price
  cakestore.price * quantity
end

end
