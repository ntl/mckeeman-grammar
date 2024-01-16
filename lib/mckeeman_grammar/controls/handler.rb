module McKeemanGrammar
  module Controls
    module Handler
      def self.example(&block)
        if block.nil?
          example_class = Example
        else
          example_class = example_class(&block)
        end

        example_class.new
      end

      def self.rule_name
        RuleName.example
      end

      def self.example_class(&block)
        ::Class.new do
          include McKeemanGrammar::Handler

          class_exec(&block)
        end
      end

      class Example
        include McKeemanGrammar::Handler

        attr_accessor :handled_match

        def handle_some_rule(match)
          self.handled_match = match
        end

        def handled_match?(match)
          self.handled_match == match
        end
        alias :handled? :handled_match?
      end

      class All
        include McKeemanGrammar::Handler

        attr_accessor :handled_match

        def handle_match(match)
          self.handled_match = match
        end

        def handled?(match)
          match == handled_match
        end
      end

      class None
        include McKeemanGrammar::Handler
      end
    end
  end
end
