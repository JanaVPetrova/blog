module PostRepository
  extend ActiveSupport::Concern

  included do
    state_machine.states.each do |s|
      scope s.name, -> { where(state: s.name) }
    end
    scope :web, -> { with_validation_state :restored }
  end
end
