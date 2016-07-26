require 'spec_helper'

describe JqueryQueryBuilder::Operators::IsEmpty do
  describe '#evaluate' do
    context 'input is empty' do
      it 'should return true' do
        expect(subject.evaluate("", nil)).to eq(true)
      end
    end
    context 'input is not empty' do
      it 'should return false' do
        expect(subject.evaluate(1.2, nil)).to eq(false)
      end
    end
  end
end

