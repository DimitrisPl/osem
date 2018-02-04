class SponsorshipSerializer < ActiveModel::Serializer
  attributes :id, :status, :category, :amount, :created_at, :updated_at
  has_one :Sponsor
end
