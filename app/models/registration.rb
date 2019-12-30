class Registration < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates_presence_of :how_heard

  validates :how_heard, inclusion: { in: %w(Twitter Facebook Friends NewsPaper),
    message: "%{value} is not a valid HOW_HEARD" }, if: Proc.new{ |obj| !obj.how_heard.blank? }

  validate :check_spot_for_event

  scope :persisted_records, -> { where("id IS NOT NULL") }

  HOW_HEARD = ["Twitter", "Facebook", "Friends", "NewsPaper"]

  def persisted_records
    where "id IS NOT NULL"
  end

  private
    def check_spot_for_event
      if event.sold_out?
        errors.add(:base, 'No Spot available.')
      end
    end
end
