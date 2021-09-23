require 'spec_helper'

describe JqueryQueryBuilder::Generators::SQL::Operators::NotIn do
  describe '#generate' do
    it 'should generate the sql where clause' do
      expect(subject.generate("abcde", [1])).to eq("(abcde NOT IN (1))")
    end
  end
end