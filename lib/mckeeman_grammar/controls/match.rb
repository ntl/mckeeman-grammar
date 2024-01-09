module McKeemanGrammar
  module Controls
    module Match
      def self.example(rule_name: nil, segments: nil)
        rule_name ||= self.rule_name

        if segments == :none
          segments = []
        else
          segments ||= self.segments
        end

        McKeemanGrammar::Match.build(*segments, rule_name:)
      end

      def self.rule_name
        Rule::Name.example
      end

      def self.segments
        ["a", Nested.example, "c"]
      end

      def self.string
        "abc"
      end

      module Nested
        def self.example
          Match.example(rule_name:, segments:)
        end

        def self.rule_name
          :some_nested_rule
        end

        def self.segments
          ["b"]
        end
      end

      module Singleton
        def self.example(segment=nil)
          segment ||= self.segment

          segments = [segment]

          Match.example(rule_name:, segments:)
        end

        def self.rule_name
          :some_singleton_rule
        end

        def self.segment
          "a"
        end
      end

      module Range
        def self.example(range=nil, segment: nil)
          range ||= self.range
          segment ||= range.begin

          segments = [segment]

          Match.example(rule_name:, segments:)
        end

        def self.rule_name
          :some_range_rule
        end

        def self.segment
          "a"
        end
      end

      module Characters
        def self.example(characters=nil)
          characters ||= self.characters

          segment = characters
          segments = [segment]

          Match.example(rule_name:, segments:)
        end

        def self.rule_name
          :some_range_rule
        end

        def self.characters
          "some-text"
        end
      end
    end
  end
end
