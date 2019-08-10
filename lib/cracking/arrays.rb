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

  def permutation_2(s1,s2)
    test = Hash.new(0)
    s1.each_char.with_object(test) do |c, memo|
      memo[c] += 1
    end
    s2.each_char.with_object(test) do |c, memo|
      memo[c] -= 1
    end
    test.values.all?(&:zero?)
  end

  def url(s)
    s.each_char.reduce('') do |memo, c|
      memo << (c == ' ' ? '%20' : c)
    end
  end

  def url_2(s)
    s.strip!
    c = s.count(' ')
    arr = s.chars + [nil] * (c * 2 + 1)
    idx = s.size - 1
    (s.size - 1).downto(0) do |sidx|
      # require 'pry'; binding.pry
      if arr[sidx] == ' '
        arr[idx] = '0'
        arr[idx - 1] = '2'
        arr[idx - 2] = '%'
        idx -= 3
      else
        arr[idx] = arr[sidx]
        idx -= 1
      end
    end
    arr.join
  end

  def palindrome_permutation(s)
    s.each_char.with_object(Hash.new(0)) do |c, memo|
      memo[c] += 1
    end.values.count(&:odd?) <= 1
  end

  def one_away(s1, s2)
    m, n = s1.size, s2.size
    return false if (m - n).abs > 1

    count = i = j = 0
    while i < m && j < n
      if s1[i] != s2[j]
        return false if count == 1

        case m <=> n
        when -1
          i += 1
        when 0
          i += 1
          j += 1
        when 1
          j += 1
        end
        count += 1
      else
        i += 1
        j += 1
      end
    end
    count += 1 if i < m || j < n
    count == 1
  end

  def runlength_compression(s)
    compressed = s.each_char.each_cons.with_object([[s[0]]]) do |(p, c), memo|
      p == c ? memo.last << c : memo << [c]
    end.reduce('') do |memo, arr|
      memo << "#{a.size}#{a[0]}"
    end
    compressed.size < s.size ? compressed : -1
  end

  def transpose(array)
    # array.transpose
    array.first.zip(*array[1..-1])
  end

  def zero_array(arr)
    m = arr.size - 1
    n = arr.first.size - 1
    cflag = (0..m).reduce(1) { |memo, i| memo & arr[i][0] }
    rflag = (1..n).reduce(1) { |memo, i| memo & arr[0][i] }
    (1..m).each do |i|
      (1..n).each do |j|
        if arr[i][j].zero?
          arr[0][j] = 0
          arr[i][0] = 0
        else
          arr[i][j] = 0
        end
      end
    end
    arr = (1..m).each_with_object(arr) do |i, memo|
      (1..n).each do |j|
        memo[i][j] = 1 unless (memo[i][0] & memo[0][j]).zero?
      end
    end
    cflag.zero? && (1..m).each_with_object(arr) { |i, memo| memo[i][0] = 0 }
    rflag.zero? && (0..n).each_with_object(arr) { |j, memo| memo[0][j] = 0 }
    arr
  end

  def rotated_substring?(s1, s2)
    is_substring = ->(needle, haystack) { %r{#{needle}}.match? haystack }
    is_substring[s1, s2 + s2]
  end
end
