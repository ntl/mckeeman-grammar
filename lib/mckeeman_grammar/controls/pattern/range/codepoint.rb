module McKeemanGrammar
  module Controls
    module Pattern
      module Range
        module Codepoint
          def self.range_begin
            excluded_codepoint - 1
          end

          def self.excluded_codepoint
            excluded_range_begin - 1
          end

          def self.excluded_range_begin
            excluded_range_member - 1
          end

          def self.excluded_range_member
            excluded_range_end - 1
          end

          def self.excluded_range_end
            member - 1
          end

          def self.member
            Controls::Codepoint.example
          end

          def self.range_end
            member + 1
          end
        end
      end
    end
  end
end
