require 'spec_helper'

describe JqueryQueryBuilder::Generator do
  context 'SQL (default)' do
    describe '#new' do
      context 'with an object' do
        it 'should initialize a new evaluator' do
          generator = JqueryQueryBuilder::Generator.new({})
        end
      end

      context 'with json' do
        it 'should initialize a new evaluator' do
          generator = JqueryQueryBuilder::Generator.new("{}")
        end
      end
    end

    describe '#generate' do
      it 'should try generate using the generator class' do
        generator = JqueryQueryBuilder::Generator.new({})
        expect(generator.generator).to receive(:generate).and_call_original
        result = generator.generate
        expect(result).to eq(nil)
      end
    end

  end
end
