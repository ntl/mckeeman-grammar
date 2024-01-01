module McKeemanGrammar
  Match = Struct.new(:rule_name, :items)

  class Match
    MatchError = Class.new(RuntimeError)

    def length
      items&.sum(&:length)
    end

    def get_item_by_position(position)
      items.at(position)
    end
    alias :item_by_position :get_item_by_position
    alias :at :item_by_position

    def get_items_by_range(range)
      items.slice(range)
    end
    alias :items_by_range :get_items_by_range
    alias :slice :items_by_range

    def get_items_by_rule(rule_name)
      items.select do |item|
        if item.instance_of?(Match)
          item_rule_name = item.rule_name
        end

        item_rule_name == rule_name
      end
    end
    alias :items_by_rule :get_items_by_rule

    def get_item_by_rule(rule_name)
      items = get_items_by_rule(rule_name)

      if items.length > 1
        raise MatchError, "Multiple items match rule #{rule_name.inspect} (Items: #{items.map(&:to_s).inspect})"
      end

      item = items.first

      return item
    end
    alias :item_by_rule :get_item_by_rule

    def get_item(val)
      case val
      in Symbol => rule_name
        get_item_by_rule(rule_name)
      in Integer => position
        get_item_by_position(position)
      end
    end
    alias :item :get_item

    def get_items(val)
      case val
      in Symbol => rule_name
        get_items_by_rule(rule_name)
      in Range => range
        get_items_by_range(range)
      end
    end

    def get(val)
      case val
      in Symbol
        items = get_items(val)

        if items.count > 1
          items
        else
          item = items.first
          item
        end
      in Integer
        get_item(val)
      in Range
        get_items(val)
      end
    end
    alias :[] :get

    def text?(text)
      text == self.text
    end

    def start_with?(text)
      self.text.start_with?(text)
    end

    def end_with?(text)
      self.text.end_with?(text)
    end

    def deconstruct
      items.map(&:to_s)
    end

    def deconstruct_keys(keys=nil)
      if keys.nil?
        keys = [:rule, :text, rule_name]

        items.each do |item|
          if item.instance_of?(Match)
            rule_name = item.rule_name

            keys << rule_name
          end
        end
      end

      hash = {}

      keys.each do |key|
        item_match = item_by_rule(key)

        if not item_match.nil?
          item_rule_name = key
          item_text = item_match.text

          hash[item_rule_name] = item_text
        elsif key == :rule
          hash[:rule] = rule_name
        elsif key == :text
          hash[:text] = text
        elsif key == rule_name
          hash[rule_name] = text
        end
      end

      hash
    end

    def text
      @text ||= items.map(&:to_s).join
    end
    alias :to_s :text
  end
end
