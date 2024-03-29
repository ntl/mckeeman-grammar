module McKeemanGrammar
  module Pattern
    class Range
      include Pattern
      include Initializer

      initializer :range, :exclusions

      def self.build(range, *exclusions)
        new(range, exclusions)
      end

      def match(text)
        codepoint = text.unpack1("U")

        if not member?(codepoint)
          return nil
        end

        ## Test
        match_segment = [codepoint].pack("U")
        Match.build(match_segment)
      end

      def member?(codepoint)
        if not range.include?(codepoint)
          return false
        elsif excluded?(codepoint)
          return false
        else
          return true
        end
      end

      def excluded?(codepoint)
        exclusions.any? do |exclusion|
          case exclusion
          in Integer => compare_codepoint
            codepoint == compare_codepoint
          in ::Range => exclusion_range
            exclusion_range.include?(codepoint)
          end
        end
      end

      def source
        source = String.new

        source << range_source(range)

        exclusions.each do |exclusion|
          source << " - "

          case exclusion
          in Integer => codepoint
            source << Singleton.source(codepoint)
          in ::Range => exclusion_range
            source << range_source(exclusion_range)
          end
        end

        source
      end

      def range_source(range)
        range_begin = Singleton.source(range.begin)

        # 0x10FFFF is the largest Unicode codepoint
        range_end = range.end || 0x10FFFF
        range_end = Singleton.source(range_end)

        "#{range_begin} . #{range_end}"
      end
    end
  end
end
