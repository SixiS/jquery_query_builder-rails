require 'spec_helper'

describe JqueryQueryBuilder::Operators::Less do
  describe '#evaluate' do
    context 'left greater than right' do
      it 'should return false' do
        expect(subject.evaluate(2.5, 1.2)).to eq(false)
      end
    end
    context 'left less than right' do
      it 'should return true' do
        expect(subject.evaluate(1.2, 1.5)).to eq(true)
      end
    end
  end
end

