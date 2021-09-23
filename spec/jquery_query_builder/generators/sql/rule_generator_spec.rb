require 'spec_helper'

describe JqueryQueryBuilder::Generators::SQL::RuleGenerator do
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

  describe '#generate' do
    it 'should generate using the operator with the value' do
      rule_generator = described_class.new(decimal_rule)

      operator = JqueryQueryBuilder::Generators::SQL::Operators::Equal.new
      value = 1.2

      expect(rule_generator).to receive(:get_operator).and_return(operator)
      expect(decimal_rule).to receive(:get_value).and_return(value)

      expect(rule_generator.generate).to eq("(Decimal_Question = 1.2)")
    end
  end
end