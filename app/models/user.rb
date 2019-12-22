class User < ActiveRecord::Base
  def self.all
    ['Tam', 'Tri', 'Son', 'Toan', 'Tu']
  end
end
