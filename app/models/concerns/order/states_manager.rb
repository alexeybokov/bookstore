module Order::StatesManager
  extend ActiveSupport::Concern

  included do
    include ActiveModel::Transitions

    STATE_IN_PROGRESS = :in_progress
    STATE_SHIPPED = :shipped
    STATE_COMPLETED = :completed

    state_machine initial: STATE_IN_PROGRESS do
      state STATE_IN_PROGRESS
      state STATE_SHIPPED
      state STATE_COMPLETED


      event :shipped do
        transitions(
          to: STATE_SHIPPED,
          from: STATE_IN_PROGRESS
        )
      end

      event :completed do
        transitions(
          to: STATE_COMPLETED,
          from: STATE_SHIPPED,
          on_transition: :set_completed_date
        )
      end
    end

    private

    def set_completed_date
      if new_record?
        self.completed_date = Time.zone.now
      else
        update(completed_date: Time.zone.now)
      end
    end
  end
end
