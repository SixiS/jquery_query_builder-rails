require 'spec_helper'

describe JqueryQueryBuilder::Generators::SQL::Operator do
  let(:decimal_rule){
    {
      'id' =>     "Decimal_Question",
      'field' =>  "Decimal_Question",
      'type' =>   "double",
      'input' =>  "text",
      'operator' => "equal",
      'value' =>  "1.2"
    }
  }
  let(:boolean_rule){
    {
      "id" => "Yes_No_Question",
      "field" => "Yes_No_Question",
      "type" => "boolean",
      "input" => "select",
      "operator" => "equal",
      "value" => "true"
    }
  }

  describe '.get_operator_class' do
    it 'should return an operator class on the operator' do
      expect(JqueryQueryBuilder::Generators::SQL::Operator.get_operator_class('equal').to_s).to eq('JqueryQueryBuilder::Generators::SQL::Operators::Equal')
      expect(JqueryQueryBuilder::Generators::SQL::Operator.get_operator_class('not_equal').to_s).to eq('JqueryQueryBuilder::Generators::SQL::Operators::NotEqual')
    end
  end
end
