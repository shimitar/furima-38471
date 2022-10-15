class Place < ApplicationRecord
  attr_accessor :token

  belongs_to :buy
end
