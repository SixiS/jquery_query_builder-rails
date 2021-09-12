require 'spec_helper'

describe JqueryQueryBuilder::Evaluators::Boolean::Operators::NotBetween do
  describe '#evaluate' do
    context 'input is between bounds' do
      it 'should return false' do
        expect(subject.evaluate(3, [1,5])).to eq(false)
      end
    end
    context 'input is not between bounds' do
      it 'should return true' do
        expect(subject.evaluate(11, [1,5])).to eq(true)
      end
    end
  end
end

