module McKeemanGrammar
  module Controls
    module Match
      def self.example(rule_name: nil, items: nil)
        rule_name ||= self.rule_name
        items ||= self.items

        McKeemanGrammar::Match.new(rule_name, items)
      end

      def self.rule_name
        Rule::Name.example
      end

      def self.items
        ['a', Nested.example, 'c']
      end

      def self.string
        'abc'
      end

      module Nested
        def self.example
          Match.example(rule_name:, items:)
        end

        def self.rule_name
          :some_nested_rule
        end

        def self.items
          ['b']
        end
      end

      module Singleton
        def self.example(item=nil)
          item ||= self.item

          items = [item]

          Match.example(rule_name:, items:)
        end

        def self.rule_name
          :some_singleton_rule
        end

        def self.item
          'a'
        end
      end

      module Range
        def self.example(range=nil, item: nil)
          range ||= self.range
          item ||= range.begin

          items = [item]

          Match.example(rule_name:, items:)
        end

        def self.rule_name
          :some_range_rule
        end

        def self.item
          'a'
        end
      end

      module Characters
        def self.example(characters=nil)
          characters ||= self.characters

          item = characters
          items = [item]

          Match.example(rule_name:, items:)
        end

        def self.rule_name
          :some_range_rule
        end

        def self.characters
          'some-text'
        end
      end
    end
  end
end
