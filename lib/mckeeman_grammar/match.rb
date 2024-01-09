module McKeemanGrammar
  Match = Struct.new(:rule_name, :segments)

  class Match
    MatchError = Class.new(RuntimeError)

    def self.build(*segments, rule_name: nil)
      new(rule_name, segments)
    end

    def self.nothing
      build
    end

    def length
      segments&.sum(&:length)
    end

    def get_segment_by_position(position)
      segments.at(position)
    end
    alias :segment_by_position :get_segment_by_position
    alias :at :segment_by_position

    def get_segments_by_range(range)
      segments.slice(range)
    end
    alias :segments_by_range :get_segments_by_range
    alias :slice :segments_by_range

    def get_segments_by_rule(rule_name)
      segments.select do |segment|
        if segment.instance_of?(Match)
          segment_rule_name = segment.rule_name
        end

        segment_rule_name == rule_name
      end
    end
    alias :segments_by_rule :get_segments_by_rule

    def get_segment_by_rule(rule_name)
      segments = get_segments_by_rule(rule_name)

      if segments.length > 1
        raise MatchError, "Multiple segments match rule #{rule_name.inspect} (Segments: #{segments.map(&:to_s).inspect})"
      end

      segment = segments.first

      return segment
    end
    alias :segment_by_rule :get_segment_by_rule

    def get_segment(val)
      case val
      in Symbol => rule_name
        get_segment_by_rule(rule_name)
      in Integer => position
        get_segment_by_position(position)
      end
    end
    alias :segment :get_segment

    def get_segments(val)
      case val
      in Symbol => rule_name
        get_segments_by_rule(rule_name)
      in Range => range
        get_segments_by_range(range)
      end
    end

    def get(val)
      case val
      in Symbol
        segments = get_segments(val)

        if segments.count > 1
          segments
        else
          segment = segments.first
          segment
        end
      in Integer
        get_segment(val)
      in Range
        get_segments(val)
      end
    end
    alias :[] :get

    def string?(str)
      str == self.string
    end

    def start_with?(str)
      string.start_with?(str)
    end

    def end_with?(str)
      string.end_with?(str)
    end

    def deconstruct
      segments.map(&:to_s)
    end

    def deconstruct_keys(keys=nil)
      if keys.nil?
        keys = [:rule, :string, rule_name]

        segments.each do |segment|
          if segment.instance_of?(Match)
            rule_name = segment.rule_name

            keys << rule_name
          end
        end
      end

      hash = {}

      keys.each do |key|
        segment_match = segment_by_rule(key)

        if not segment_match.nil?
          segment_rule_name = key
          segment_string = segment_match.string

          hash[segment_rule_name] = segment_string
        elsif key == :rule
          hash[:rule] = rule_name
        elsif key == :string
          hash[:string] = string
        elsif key == rule_name
          hash[rule_name] = string
        end
      end

      hash
    end

    def string
      @string ||= segments.map(&:to_s).join
    end
    alias :to_s :string
  end
end
