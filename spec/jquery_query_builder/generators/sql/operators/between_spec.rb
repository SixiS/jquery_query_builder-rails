require 'spec_helper'

describe JqueryQueryBuilder::Generators::SQL::Operators::Between do
  describe '#generate' do
    it 'should generate the sql where clause' do
      expect(subject.generate("abcde", [1,2])).to eq("(abcde BETWEEN 1 AND 2)")
    end
  end
end