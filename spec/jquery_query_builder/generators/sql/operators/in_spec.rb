require 'spec_helper'

describe JqueryQueryBuilder::Generators::SQL::Operators::In do
  describe '#generate' do
    it 'should generate the sql where clause' do
      expect(subject.generate("abcde", [1])).to eq("(abcde IN (1))")
    end
  end
end