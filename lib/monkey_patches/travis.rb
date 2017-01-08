module Travis
  module Client
    # a build attempt
    class Build
      # Represents a build as a string showing its build number
      #
      # @return String
      def to_s
        "build ##{number}"
      end
    end
  end
end