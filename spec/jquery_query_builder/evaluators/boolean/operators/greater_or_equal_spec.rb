require 'spec_helper'

describe JqueryQueryBuilder::Evaluators::Boolean::Operators::GreaterOrEqual do
  describe '#evaluate' do
    context 'left equals right' do
      it 'should return true' do
        expect(subject.evaluate(1.2, 1.2)).to eq(true)
      end
    end
    context 'left greater than right' do
      it 'should return true' do
        expect(subject.evaluate(1.2, 0.6)).to eq(true)
      end
    end
    context 'left less than right' do
      it 'should return false' do
        expect(subject.evaluate(1.2, 1.5)).to eq(false)
      end
    end
  end
end

