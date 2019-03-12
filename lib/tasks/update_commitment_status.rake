require "#{Rails.root}/app/helpers/commitments_helper"
include CommitmentsHelper

namespace :update_commitments_status do
  desc "TODO"
  task update_status: :environment do
    Commitment.all.each do |commitment|
      commitment.update_attribute(:status, return_status(commitment))
    end
  end
end
