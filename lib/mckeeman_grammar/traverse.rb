module McKeemanGrammar
  class Traverse
    SyntaxError = Class.new(RuntimeError)

    include Initializer

    def rule_stack
      @rule_stack ||= []
    end

    initializer :root_pattern, :handler

    ## Use handle.handle? predicate - Nathan, Tue Jan 16 2024
    def call(text)
      match = root_pattern.match(text)

      if not match.nil?
        matched(match)

        if match.length < text.length
          ## Message - Nathan, Thu Jan 16 2024
          raise SyntaxError, "#{match.length} < #{text.length}"
        end
      else
        ## Message - Nathan, Thu Jan 16 2024
        raise SyntaxError, "No match"
      end

      match
    end

    def matched(match)
      rule_name = match.rule_name
      if !rule_name.nil? && handler.handle?(match)
        rule_stack.push(rule_name)
        #puts "#{" " * rule_stack.length}- #{rule_name.inspect} (#{rule_stack})"
      end

      handler.handle(match)

      match.segments.each do |segment|
        case segment
        in Match => match
          rule_name = match.rule_name

          if rule_stack.include?(rule_name)
            #puts "#{" " * rule_stack.length}- #{rule_name.inspect} (#{rule_stack})"
            next
          end

          matched(match)

        in String
        end
      end

      if not rule_name.nil?
        rule_stack.pop
      end
    end
  end
end
