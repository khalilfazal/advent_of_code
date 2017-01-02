class MatchData
  def capture_entities(*entities)
    entities.map do |entity|
      {
          key: self["#{entity}_key"],
          type: self["#{entity}_type"],
          id: self["#{entity}_id"].to_i
      }
    end
  end
end