class Commitment < ApplicationRecord
  belongs_to :user
  belongs_to :initiative

  enum stage: [:process_structuring, :data_collecting, :process_automation, :data_analysis]
  enum status: [:backlog, :waiting, :this_week, :today, :expired, :closed_before_deadline, :closed_after_deadline]
end
