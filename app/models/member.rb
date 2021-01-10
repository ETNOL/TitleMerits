class Member < ApplicationRecord
  belongs_to :organization
  has_many :member_merits
end
