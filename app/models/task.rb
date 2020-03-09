class Task < ApplicationRecord
    validates :content, presence: true, length: { maximum: 10 }
    validates :status, presence: true, length: { maximum: 10 }
    belongs_to :user #User と Micropost の一対多を表現しています。
end
