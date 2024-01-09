module McKeemanGrammar
  module Controls
    module Pattern
      module Range
        def self.example(range: nil, exclusions: nil)
          range ||= (range_begin..range_end)

          if exclusions == :none
            exclusions = []
          else
            exclusions ||= Exclusion.examples
          end

          McKeemanGrammar::Pattern::Range.build(range, *exclusions)
        end

        def self.range_begin
          Codepoint.range_begin
        end

        def self.member
          Codepoint.member
        end

        def self.range_end
          Codepoint.range_end
        end

        module All
          def self.example
            Range.example(range:)
          end

          def self.range
            (0..)
          end
        end

        module None
          def self.example
            Range.example(range:)
          end

          def self.range
            (0...0)
          end
        end

        module Exclusion
          def self.examples
            [Singleton.example, Range.example]
          end

          module Singleton
            def self.example
              codepoint
            end

            def self.codepoint
              Codepoint.excluded_codepoint
            end
          end

          module Range
            def self.example
              (range_begin..range_end)
            end

            def self.range_begin
              Codepoint.excluded_range_begin
            end

            def self.member
              Codepoint.excluded_range_member
            end

            def self.range_end
              Codepoint.excluded_range_end
            end
          end
        end
      end
    end
  end
end
