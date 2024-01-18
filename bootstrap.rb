class GrammarParser
  include Handler

  def builder
    @builder ||= Builder.new
  end

  def rule_registry
    builder.rule_registry
  end

  handle :rule do |rule|
    if builder.current_rule?
      builder.finish_rule
    end
  end

  handle :alternative do
    if builder.current_alternative?
      builder.finish_alternative
    end

    builder.start_alternative
  end

  handle :name do |name|
    rule_name = name.to_s.to_sym

    if builder.current_rule?
      builder.name(rule_name)
    else
      builder.start_rule(rule_name)
    end
  end

  handle :nothing do |nothing|
    if not nothing.string.empty?
      builder.nothing
    end
  end

  handle :literal do |literal|
    case literal
    in singleton:
      codepoint = codepoint(singleton)

      builder.singleton(codepoint)
    in range_text, excludes_text
      range = range(range_text)

      if not excludes_text.empty?
        excludes = excludes(excludes_text)
      end

      builder.range(range, *excludes)
    in '"', characters, '"'
      builder.character_literal(characters)
    end
  end

  def excludes(excludes_text)
    excludes = excludes_text.split(" - ")
    excludes.delete_at(0)

    excludes.map do |text|
      if text.include?(" . ")
        range(text)
      else
        codepoint(text)
      end
    end
  end

  def range(range_text)
    range_begin, range_end = range_text.split(" . ")

    range_begin = codepoint(range_begin)
    range_end = codepoint(range_end)

    (range_begin..range_end)
  end

  def codepoint(singleton)
    contents = singleton[1...-1]

    if contents.length == 1
      codepoint = contents.unpack1("U")
    else
      codepoint = contents.to_i(16)
    end
  end
end

class Bootstrap < Builder
  def self.call(grammar_text)
    instance = new
    bootstrap_root_pattern = instance.()

    bootstrap_handler = GrammarParser.new
    traverse = Traverse.new(bootstrap_root_pattern, bootstrap_handler)

    traverse.(grammar_text)
    bootstrap_handler.builder.finish_rule

    rule_registry = bootstrap_handler.rule_registry
    rule_registry
  end

  def call
    rule!(:grammar) do
      name(:rules)
    end

    rule!(:space) do
      singleton(0x0020)
    end

    rule!(:newline) do
      singleton(0x000A)
    end

    rule(:name) do
      alternative do
        name(:letter)
      end

      alternative do
        name(:letter)
        name(:name)
      end
    end

    rule(:letter) do
      alternative do
        range!("a".."z")
      end

      alternative do
        range!("A".."Z")
      end

      alternative do
        singleton!("_")
      end
    end

    rule!(:indentation) do
      name(:space)
      name(:space)
      name(:space)
      name(:space)
    end

    rule(:rules) do
      alternative do
        name(:rule)
      end

      alternative do
        name(:rule)
        name(:newline)
        name(:rules)
      end
    end

    rule!(:rule) do
      name(:name)
      name(:newline)
      name(:nothing)
      name(:alternatives)
    end

    rule(:nothing) do
      nothing

      alternative do
        name(:indentation)
        singleton!('"')
        singleton!('"')
        name(:newline)
      end
    end

    rule(:alternatives) do
      alternative do
        name(:alternative)
      end

      alternative do
        name(:alternative)
        name(:alternatives)
      end
    end

    rule!(:alternative) do
      name(:indentation)
      name(:items)
      name(:newline)
    end

    rule(:items) do
      alternative do
        name(:item)
      end

      alternative do
        name(:item)
        name(:space)
        name(:items)
      end
    end

    rule(:item) do
      alternative do
        name(:literal)
      end

      alternative do
        name(:name)
      end
    end

    rule(:literal) do
      alternative do
        name(:singleton)
      end

      alternative do
        name(:range)
        name(:exclude)
      end

      alternative do
        singleton!('"')
        name(:characters)
        singleton!('"')
      end
    end

    rule!(:singleton) do
      singleton!("'")
      name(:codepoint)
      singleton!("'")
    end

    rule(:codepoint) do
      alternative do
        range!(" ".."\u{10FFFF}")
      end

      alternative do
        name(:hexcode)
      end
    end

    rule(:hexcode) do
      alternative do
        character_literal("10")
        name(:hex)
        name(:hex)
        name(:hex)
        name(:hex)
      end

      alternative do
        name(:hex)
        name(:hex)
        name(:hex)
        name(:hex)
        name(:hex)
      end

      alternative do
        name(:hex)
        name(:hex)
        name(:hex)
        name(:hex)
      end
    end

    rule(:hex) do
      alternative do
        range!("0".."9")
      end

      alternative do
        range!("A".."F")
      end
    end

    rule!(:range) do
      name(:singleton)
      name(:space)
      singleton!(".")
      name(:space)
      name(:singleton)
    end

    rule(:exclude) do
      nothing

      alternative do
        name(:space)
        singleton!("-")
        name(:space)
        name(:singleton)
        name(:exclude)
      end

      alternative do
        name(:space)
        singleton!("-")
        name(:space)
        name(:range)
        name(:exclude)
      end
    end

    rule(:characters) do
      alternative do
        name(:character)
      end

      alternative do
        name(:character)
        name(:characters)
      end
    end

    rule!(:character) do
      range!(" ".."\u{10FFFF}", '"')
    end

    rule_registry.get(:grammar)
  end

  def rule(rule_name, &block)
    start_rule(rule_name)

    block.()

    finish_rule
  end

  def rule!(rule_name, &block)
    rule(rule_name) do
      alternative(&block)
    end
  end

  def alternative(&block)
    start_alternative

    block.()

    finish_alternative
  end

  def singleton!(character)
    codepoint = get_codepoint(character)

    singleton(codepoint)
  end

  def range!(range, *exclusions)
    range = get_range(range)

    exclusions.map! do |exclusion|
      case exclusion
      in Range => exclusion_range
        get_range(exclusion_range)
      in String => character
        get_codepoint(character)
      end
    end

    range(range, *exclusions)
  end

  def get_range(range)
    range_begin = get_codepoint(range.begin)
    range_end = get_codepoint(range.end)

    (range_begin..range_end)
  end

  def get_codepoint(character)
    character.unpack1("U")
  end
end
