module McKeemanGrammar
  module Controls
    module Match
      def self.example(rule_name: nil, items: nil)
        rule_name ||= self.rule_name
        items ||= self.items

        match = McKeemanGrammar::Match.new
        match.rule_name = rule_name
        match.items = items
        match
      end

      def self.rule_name
        Rule::Name.example
      end

      def self.items
        ['a', Nested.example, 'c']
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
    end
  end
end
