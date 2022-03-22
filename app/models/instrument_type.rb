class InstrumentType < ApplicationRecord
  belongs_to :type
  belongs_to :instrument
end
