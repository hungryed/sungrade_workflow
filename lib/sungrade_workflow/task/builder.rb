module SungradeWorkflow
  class Task
    class Builder
      attr_reader :process, :procedure, :position, :name, :participant

      def initialize(process:, procedure:, position:, name:, participant:, **opts)
        @process = process
        @procedure = procedure
        @position = position
        @name = name
        @participant = participant
      end

      def model_instance
        @model_instance ||= Storage.instance.create_task(
          process: process,
          procedure: procedure,
          position: position,
          name: name,
          participant_class: participant,
        )
      end

      def store!
        model_instance
      end
    end
  end
end
