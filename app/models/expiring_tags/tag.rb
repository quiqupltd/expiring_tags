class ExpiringTags::Tag < ActiveRecord::Base
  has_many :taggings, class_name: 'ExpiringTags::Tagging', dependent: :destroy

  validates :tag, presence: true

  # Equivalent to created_at + expires_in.minutes > Time.now
  scope :active, -> { where("(tags.created_at + (expires_in || 'minutes')::interval) >= clock_timestamp() OR expires_in IS NULL") }

  default_scope -> { active }
end