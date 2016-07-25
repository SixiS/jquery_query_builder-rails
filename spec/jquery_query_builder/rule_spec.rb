require 'spec_helper'

describe JqueryQueryBuilder::Rule do
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

  describe '#new' do
  end

  describe '#get_operator' do
  end

  describe '#get_input' do
  end

  describe '#get_value' do
  end

  describe '#typecast_value' do
  end

  describe '#evaluate' do
  end
end
