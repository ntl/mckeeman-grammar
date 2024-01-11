module McKeemanGrammar
  module Pattern
    def self.coerce(value, rules: nil)
      rules ||= {}

      case value
      in nil
        Nothing.build
      in Integer => codepoint
        Singleton.new(codepoint)
      in String => characters
        CharacterLiteral.new(characters)
      in ::Range => range
        Range.build(range)
      in Symbol => rule_name
        Name.build(rule_name, rules)
      in Array => segments
        ## Test: cannot compare control patterns and compare patterns without implementing ==
        segment_patterns = segments.map do |segment|
          ## Test: rules is passed
          coerce(segment, rules:)
        end

        Alternative.new(segment_patterns)
      end
    end
  end

  def Pattern(...)
    Pattern.coerce(...)
  end
end
