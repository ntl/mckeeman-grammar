module McKeemanGrammar
  class Traverse
    include Initializer

    initializer :root_pattern, :handler

    ## Use handle.handle? predicate - Nathan, Tue Jan 16 2024
    def call(text)
      match = root_pattern.match(text)

      matched(match)
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
