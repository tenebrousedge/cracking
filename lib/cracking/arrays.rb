module Cracking
  extend self
  def uniq_str?(str)
    str.each_char.with_object({}) do |c, memo|
      return false if memo[c]

      memo[c] = true
    end
    true
  end

  def uniq_str_int(str)
    str.each_char.reduce(0) do |memo, c|
      bit = (1 << c.ord - 'a'.ord)
      return false if (memo & bit).positive?

      memo | bit
    end
    true
  end

  def permutation?(s1, s2)
    s1.chars.sort == s2.chars.sort
  end
end
