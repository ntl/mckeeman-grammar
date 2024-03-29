module McKeemanGrammar
  module Controls
    module RuleName
      def self.example
        :some_rule
      end

      def self.other_example
        :some_other_rule
      end

      def self.random
        suffix = Random.string

        :"#{example}_#{suffix}"
      end
    end
  end
end
