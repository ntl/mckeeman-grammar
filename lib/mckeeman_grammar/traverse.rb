module McKeemanGrammar
  class Traverse
    SyntaxError = Class.new(RuntimeError)

    include Initializer

    initializer :root_pattern, :handler

    ## Use handle.handle? predicate - Nathan, Tue Jan 16 2024
    def call(text)
      match = root_pattern.match(text)

      if not match.nil?
        matched(match)

        if match.length < text.length
          ## Message - Nathan, Thu Jan 16 2024
          raise SyntaxError
        end
      else
        ## Message - Nathan, Thu Jan 16 2024
        raise SyntaxError
      end
    end

    def matched(match)
      handler.handle(match)

      match.segments.each do |segment|
        if segment.is_a?(Match)
          matched(segment)
        end
      end
    end
  end
end
