module McKeemanGrammar
  Match = Struct.new(:rule_name, :items)

  class Match
    MatchError = Class.new(RuntimeError)

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
  end
end
