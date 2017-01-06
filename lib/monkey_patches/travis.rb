module Travis
  module Client
    # a build attempt
    class Build
      # @return String
      def to_s
        "build ##{number}"
      end
    end
  end
end