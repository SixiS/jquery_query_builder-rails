require 'spec_helper'

describe JqueryQueryBuilder::Evaluators::Boolean::Operators::Greater do
  describe '#evaluate' do
    context 'left greater than right' do
      it 'should return true' do
        expect(subject.evaluate(2.5, 1.2)).to eq(true)
      end
    end
    context 'left less than right' do
      it 'should return false' do
        expect(subject.evaluate(1.2, 1.5)).to eq(false)
      end
    end
  end
end

