class ExpiringTags::Tag < ActiveRecord::Base
  has_many :taggings, class_name: 'ExpiringTags::Tagging', dependent: :destroy

  validates :tag, presence: true

  # Equivalent to created_at + expires_in.hours > Time.now
  scope :active, lambda {
    where("(tags.created_at + (expires_in || 'hours')::interval) >= ? OR expires_in IS NULL", Time.zone.now)
  }

  default_scope -> { active }
end