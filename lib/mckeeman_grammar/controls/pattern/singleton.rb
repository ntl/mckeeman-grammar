module McKeemanGrammar
  module Controls
    module Pattern
      module Singleton
        def self.example(codepoint: nil)
          codepoint ||= self.codepoint

          McKeemanGrammar::Pattern::Singleton.new(codepoint)
        end

        def self.codepoint
          Codepoint.example
        end
      end
    end
  end
end
