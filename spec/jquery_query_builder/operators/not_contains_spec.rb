require 'spec_helper'

describe JqueryQueryBuilder::Operators::NotContains do
  describe '#evaluate' do
    context 'left contains right' do
      it 'should return false' do
        expect(subject.evaluate("a big dog", "big")).to eq(false)
      end
    end
    context 'left does not contain right' do
      it 'should return true' do
        expect(subject.evaluate("something is wrong", "Bill Cosby")).to eq(true)
      end
    end
  end
end

