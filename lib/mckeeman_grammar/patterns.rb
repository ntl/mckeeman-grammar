module McKeemanGrammar
  module Patterns
    extend self

    def grammar
      rules
    end

    def space
      "\u0020"
    end

    def newline
      "\u000A"
    end

    def name
      rule!(
        :name,
        letter,
        [letter, :name]
      )
    end

    def letter
      rule!(
        :letter,
        "[a-z]",
        "[A-Z]",
        "_"
      )
    end

    def indentation
      "#{space}#{space}#{space}#{space}"
    end

    def rules
      rule!(
        :rules,
        rule,
        [rule, newline, :rules]
      )
    end

    def next_rule
      "(?<rule>#{rule}#{newline})"
    end

    def rule
      "#{name}#{newline}#{nothing}#{alternatives}"
    end

    def nothing
      rule!(
        :nothing,
        "",
        [indentation, "''", newline]
      )
    end

    def alternatives
      rule!(
        :alternatives,
        alternative,
        [alternative, :alternatives]
      )
    end

    def alternative
      "#{indentation}#{items}#{newline}"
    end

    def items
      rule!(
        :items,
        item,
        [item, space, :items]
      )
    end

    def item
      rule!(
        :item,
        literal,
        name
      )
    end

    def literal
      rule!(
        :literal,
        singleton,
        [range, exclude],
        ["'", characters, "'"]
      )
    end

    def singleton
      "'#{codepoint}'"
    end

    def codepoint
      rule!(
        :codepoint,
        "[ -\u{10FFFF}]",
        hexcode
      )
    end

    def hexcode
      rule!(
        :hexcode,
        ["10", hex, hex, hex, hex],
        [hex, hex, hex, hex, hex],
        [hex, hex, hex, hex]
      )
    end

    def hex
      rule!(:hex, "[0-9]", "[A-F]")
    end

    def range
      "#{singleton}#{space}.#{space}#{singleton}"
    end

    def exclude
      rule!(
        :exclude,
        "",
        [space, "-", space, singleton, :exclude],
        [space, "-", space, range, :exclude]
      )
    end

    def characters
      rule!(
        :characters,
        character,
        [character, :characters]
      )
    end

    def character
      "[ -\u{10FFFF}&&[^\"]]"
    end

    def rule!(name, alternative, *alternatives)
      alternatives.unshift(alternative)

      pattern_text = String.new

      capture_name = nil

      alternatives.reverse_each.with_index do |alternative, index|
        alternative = Array(alternative)

        if not index.zero?
          pattern_text << "|"
        end

        alternative.each do |segment|
          if segment == name
            capture_name ||= capture_name(name)
            pattern_text << "\\g<#{capture_name}>"
          else
            pattern_text << segment
          end
        end
      end

      if not capture_name.nil?
        "(?<#{capture_name}>#{pattern_text})"
      else
        "(?:#{pattern_text})"
      end
    end

    def capture_name(prefix)
      @sequences ||= Hash.new { |hash, key| hash[key] = 1 }

      sequence = @sequences[prefix]
      @sequences[prefix] = sequence + 1

      "#{prefix}-#{sequence}"
    end
  end
end
