module McKeemanGrammar
  module Controls
    module Pattern
      module CharacterLiteral
        def self.example
          McKeemanGrammar::Pattern::CharacterLiteral.new(characters)
        end

        def self.characters
          Text.words.first
        end
      end
    end
  end
end
