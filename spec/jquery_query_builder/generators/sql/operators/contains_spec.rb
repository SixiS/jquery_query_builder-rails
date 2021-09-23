require 'spec_helper'

describe JqueryQueryBuilder::Generators::SQL::Operators::Contains do
  describe '#generate' do
    it 'should generate the sql where clause' do
      expect(subject.generate("abcde", "lol")).to eq("(LOWER(abcde) LIKE LOWER('%lol%'))")
    end
  end
end