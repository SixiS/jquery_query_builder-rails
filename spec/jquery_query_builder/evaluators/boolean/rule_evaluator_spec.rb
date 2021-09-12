require 'spec_helper'

describe JqueryQueryBuilder::Evaluators::Boolean::RuleEvaluator do
  let(:decimal_rule){
    JqueryQueryBuilder::Rule.new({
      'id' =>     "Decimal_Question",
      'field' =>  "Decimal_Question",
      'type' =>   "double",
      'input' =>  "text",
      'operator' => "equal",
      'value' =>  "1.2"
    })
  }

  describe '#evaluate' do
    it 'should evaluate using the operator with the input+value' do
      rule_evaluator = described_class.new(decimal_rule)

      operator = JqueryQueryBuilder::Evaluators::Boolean::Operators::Equal.new
      input = 1.2
      value = 1.2

      object = {'Decimal_Question' => input}

      expect(rule_evaluator).to receive(:get_operator).and_return(operator)
      expect(decimal_rule).to receive(:get_input).with(object).and_return(input)
      expect(decimal_rule).to receive(:get_value).and_return(value)

      expect(rule_evaluator.evaluate(object)).to eq(true)
    end
  end
end