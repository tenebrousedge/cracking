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
end