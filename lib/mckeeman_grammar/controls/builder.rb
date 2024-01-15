module McKeemanGrammar
  module Controls
    module Builder
      def self.example
        Alternative.example
      end

      module New
        def self.example
          McKeemanGrammar::Builder.new
        end
      end

      module Rule
        def self.example(rule_name=nil)
          rule_name ||= self.rule_name

          builder = New.example

          builder.start_rule(rule_name)

          builder
        end

        def self.rule_name
          RuleName.example
        end
      end

      module Alternative
        def self.example
          builder = Rule.example
          builder.start_alternative
          builder
        end
      end
    end
  end
end
