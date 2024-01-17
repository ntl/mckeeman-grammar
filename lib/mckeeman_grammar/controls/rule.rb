module McKeemanGrammar
  module Controls
    Rule = Pattern::Rule

    module Rule
      module Root
        def self.example
          builder = McKeemanGrammar::Builder.new

          builder.start_rule(:some_leaf_rule)
          builder.start_alternative
          builder.character_literal("some")
          builder.character_literal("-")
          builder.finish_alternative
          builder.finish_rule

          builder.start_rule(:some_branch_rule)
          builder.start_alternative
          builder.name(:some_leaf_rule)
          builder.character_literal("text")
          builder.finish_alternative
          builder.finish_rule

          builder.start_rule(:some_root_rule)
          builder.start_alternative
          builder.name(:some_branch_rule)
          builder.finish_alternative
          builder.finish_rule

          root_pattern = builder.rule_registry.get(:some_root_rule)

          root_pattern
        end
      end
    end
  end
end
