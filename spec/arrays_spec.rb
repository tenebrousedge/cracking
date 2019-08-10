RSpec.describe Cracking do
  it "finds whether strings have all unique characters" do
    expect(Cracking.uniq_str?("abc")).to eq true
    expect(Cracking.uniq_str?("aab")).to eq false
    expect(Cracking.uniq_str?([*?a..?z].join)).to eq true
  end
  it "finds whether strings have all unique characters: now with ints!" do
    expect(Cracking.uniq_str_int("abc")).to eq true
    expect(Cracking.uniq_str_int("aab")).to eq false
    expect(Cracking.uniq_str_int([*?a..?z].join)).to eq true
  end

  it "finds string permutations" do
    expect(Cracking.permutation?('abc', 'cab')).to eq true
    expect(Cracking.permutation?('act', 'cat')).to eq true
    expect(Cracking.permutation?('abc', 'cabo')).to eq false
  end
  it "finds string permutations 2" do
    expect(Cracking.permutation_2('abc', 'cab')).to eq true
    expect(Cracking.permutation_2('act', 'cat')).to eq true
    expect(Cracking.permutation_2('abc', 'cabo')).to eq false
  end

  it "url-encodes strings" do
    expect(Cracking.url('a b c')).to eq 'a%20b%20c'
    expect(Cracking.url('abc')).to eq 'abc'
    expect(Cracking.url(' ')).to eq '%20'
  end
  it "url-encodes strings \"in place\"" do
    #expect(Cracking.url_2('a b c')).to eq 'a%20b%20c'
    #expect(Cracking.url_2('abc')).to eq 'abc'
    #expect(Cracking.url_2(' ')).to eq '%20'
  end

  it "finds palindrome permutations" do
    expect(Cracking.palindrome_permutation('aa')).to eq true
    expect(Cracking.palindrome_permutation('abca')).to eq false
    expect(Cracking.palindrome_permutation('aba')).to eq true
  end

  it 'finds one-away strings' do
    expect(Cracking.one_away('abc', 'ab')).to eq true
    expect(Cracking.one_away('ab', 'abc')).to eq true
    expect(Cracking.one_away('abcd', 'ab')).to eq false
    expect(Cracking.one_away('abc', 'ab')).to eq true
  end

  it 'zeroes arrays' do
    input_0 = [[0,1], [1,0]]
    expected_0 = [[0,0],[0,0]]
    expect(Cracking.zero_array(input_0)).to eq expected_0
    input_1 = [[1,1,1],[1,1,1],[1,1,1]]
    expected_1 = input_1
    expect(Cracking.zero_array(input_1)).to eq expected_1
    input_3 = [[1,1,1],[1,0,1],[1,1,1]]
    expected_3 = [[1,0,1],[0,0,0],[1,0,1]]
    expect(Cracking.zero_array(input_3)).to eq expected_3
    input_4 = [[1,1,0,1],[1,1,1,1]]
    expected_4 = [[0,0,0,0],[1,1,0,1]]
    expect(Cracking.zero_array(input_4)).to eq expected_4
  end

  it 'finds rotated substrings' do
    expect(Cracking.rotated_substring?('waterbottle', 'terbottlewa')).to eq true
    expect(Cracking.rotated_substring?('acat', 'taca')).to eq true
  end
end