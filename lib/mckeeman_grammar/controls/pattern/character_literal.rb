module McKeemanGrammar
  module Controls
    module Pattern
      module CharacterLiteral
        def self.example(characters=nil)
          characters ||= self.characters

          McKeemanGrammar::Pattern::CharacterLiteral.new(characters)
        end

        def self.characters
          Text.words.first
        end
      end
    end
  end
end
