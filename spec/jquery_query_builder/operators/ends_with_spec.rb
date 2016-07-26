require 'spec_helper'

describe JqueryQueryBuilder::Operators::EndsWith do
  describe '#evaluate' do
    context 'left ends with right' do
      it 'should return true' do
        expect(subject.evaluate("abcdef", "def")).to eq(true)
      end
    end
    context 'left does not end with right' do
      it 'should return false' do
        expect(subject.evaluate("hurray", "for stuff")).to eq(false)
      end
    end
  end
end

