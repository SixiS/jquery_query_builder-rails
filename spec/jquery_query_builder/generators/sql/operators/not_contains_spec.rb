require 'spec_helper'

describe JqueryQueryBuilder::Generators::SQL::Operators::NotContains do
  describe '#generate' do
    it 'should generate the sql where clause' do
      expect(subject.generate("abcde", "lol")).to eq("(LOWER(abcde) NOT LIKE LOWER('%lol%'))")
    end
  end
end