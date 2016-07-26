require 'spec_helper'

describe JqueryQueryBuilder::Operators::NotBeginsWith do
  describe '#evaluate' do
    context 'left begins with right' do
      it 'should return false' do
        expect(subject.evaluate("abcde", "ab")).to eq(false)
      end
    end
    context 'left does not begin with right' do
      it 'should return true' do
        expect(subject.evaluate("abcde", "zz")).to eq(true)
      end
    end
  end
end

