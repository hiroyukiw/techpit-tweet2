class Tweet < ApplicationRecord
  belongs_to :user

  # この行を追加する
  validates :text, length: { maximum: 140 }
end