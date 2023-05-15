class Bar < ApplicationRecord
  has_many :kegs

  def keg_count
    Keg.count
  end
end