require 'spec_helper'

describe JqueryQueryBuilder::Generators::SQL::Operators::IsNull do
  describe '#generate' do
    it 'should generate the sql where clause' do
      expect(subject.generate("abcde", nil)).to eq("(abcde IS NULL)")
    end
  end
end