class Banner < ApplicationRecord

  acts_as_paranoid column: :hidden_at
  include ActsAsParanoidAliases

  validates :title, presence: true,
                    length: { minimum: 2 }
  validates :description,  presence: true
  validates :target_url, presence: true
  validates :style, presence: true
  validates :image, presence: true
  validates :post_started_at, presence: true
  validates :post_ended_at, presence: true

  scope :with_active,  -> {where("post_started_at <= ?", Time.now).
                      where("post_ended_at >= ?", Time.now) }

  scope :with_inactive,-> {where("post_started_at > ? or post_ended_at < ?", Time.now, Time.now) }

end