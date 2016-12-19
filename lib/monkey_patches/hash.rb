class Hash
  def to_cookie_jar
    map do |name, value|
      "#{name}=#{value}"
    end.join ';'
  end
end