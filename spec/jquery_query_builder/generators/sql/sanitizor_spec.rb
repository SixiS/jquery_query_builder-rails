require 'spec_helper'

describe JqueryQueryBuilder::Generators::SQL::Sanitizor do
  describe '.sanitize' do
    it 'should sanitize the sql' do
      sanitized_sql = described_class.sanitize(["(lol) = ?", "Robert'); DROP TABLE profiles; --"])
      expect(sanitized_sql).to eq("(lol) = 'Robert''); DROP TABLE profiles; --'")
    end
  end
end
