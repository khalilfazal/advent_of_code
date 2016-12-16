class Hash
  def make_cookie
    self.map do |name, value|
      "#{name}=#{value}"
    end.join ';'
  end
end