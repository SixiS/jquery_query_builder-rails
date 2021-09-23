require 'spec_helper'

describe JqueryQueryBuilder::Generators::SQL::Operators::NotBeginsWith do
  describe '#generate' do
    it 'should generate the sql where clause' do
      expect(subject.generate("abcde", "ab")).to eq("(LOWER(abcde) NOT LIKE LOWER('ab%'))")
    end
  end
end