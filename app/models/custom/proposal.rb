require_dependency Rails.root.join('app', 'models', 'proposal').to_s

class Proposal < ActiveRecord::Base
  after_create :notify_emapic

  def notify_emapic
    EmapicConsul::Api.create_location_group(self)
  end
end
