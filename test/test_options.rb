require 'test/unit'
require 'shoulda'

# Relative files
require_relative '../lib/anagram/options'

class TestOptions < Test::Unit::TestCase
  context "specifying no dictionary" do
    should "return default" do
      opts = Anagram::Options.new(["someword"])
      assert_equal(Anagram::Options::DICTIONARY, opts.dictionary)
    end
  end

  context "specifying a dictionary" do
    should "return itself" do
      opts = Anagram::Options.new(["-d", "/usr/dict", "someword"])
      assert_equal("/usr/dict", opts.dictionary)
    end
  end

  context "specifying words and no dictionary" do
    should "return the words" do
      opts = Anagram::Options.new(["word1", "word2"])
      assert_equal(["word1", "word2"], opts.words_to_find)
    end
  end

  context "specifying words and a dictionary" do
    should "return the words" do
      opts = Anagram::Options.new(["-d", "/usr/dict", "word1", "word2"])
      assert_equal(["word1", "word2"], opts.words_to_find)
    end
  end
end
