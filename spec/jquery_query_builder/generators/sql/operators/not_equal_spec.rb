require 'spec_helper'

describe JqueryQueryBuilder::Generators::SQL::Operators::NotEqual do
  describe '#generate' do
    it 'should generate the sql where clause' do
      expect(subject.generate("abcde", "ab")).to eq("(abcde != 'ab')")
    end
  end
end