module McKeemanGrammar
  module Controls
    module Pattern
      module Range
        module Codepoint
          def self.range_begin
            0x31
          end

          def self.member
            range_begin + 1
          end

          def self.excluded_codepoint
            member + 1
          end

          def self.excluded_range_begin
            excluded_codepoint + 1
          end

          def self.excluded_range_member
            excluded_range_begin + 1
          end

          def self.excluded_range_end
            excluded_range_member + 1
          end

          def self.range_end
            excluded_range_end + 1
          end
        end
      end
    end
  end
end
