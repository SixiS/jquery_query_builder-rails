require 'spec_helper'

describe JqueryQueryBuilder::Rule do
  describe 'SENS ONE form' do
    it 'should set the accessors and initialize' do
      rule_json = {"condition"=>"AND",
                   "rules"=>
                    [{"id"=>"fields.Site_Name",
                      "field"=>"fields.Site_Name",
                      "type"=>"string",
                      "input"=>"text",
                      "operator"=>"contains",
                      "value"=>"BOB EVANS"},
                     {"id"=>"fields.Bob_Evan_s.Install_Night",
                      "field"=>"fields.Bob_Evan_s.Install_Night",
                      "type"=>"string",
                      "input"=>"select",
                      "operator"=>"equal",
                      "value"=>"2"},
                     {"id"=>"fields.CIN.Site_Abort_or_Cancel_",
                      "field"=>"fields.CIN.Site_Abort_or_Cancel_",
                      "type"=>"boolean",
                      "input"=>"select",
                      "operator"=>"equal",
                      "value"=>"false"}]}

      rule = JqueryQueryBuilder::Evaluator.new(rule_json)
      object = {"fields" => {"Customer"=>"BOB EVANS FARMS LLC", "Site_Name"=>"BOB EVANS", "STON"=>"300", "Work_Order_Number"=>"600168", "Purpose"=>"IMAC", "Industry"=>"HSR", "Street_Address"=>"1301 GOVERNORS PL", "City"=>"BEAR", "State"=>"Delaware", "Zip_Code"=>"19701-3051", "SD"=>"2016-09-11", "Scope_Of_Work"=>"Complete Site Install Night 2. Fill out and Fax Checklist and SQS to 800.854.9041. Email pictures to InstallationServices.HSR@ncr.com. Contact Britt Brittain at 205-492-0843 with any questions or concerns. Please close out your work order by sending the work order number and site times to WI230016@ncr.com. Submit expenses as NON billable. NCR Bob Evans Install checklist NIGHT 2. Justin Berryman is the lead tech and will be responsible for all paperwork and pictures. Additional Notes: (Radiant Dispatch Center only) None", "CIN"=>[{"TCIV"=>"2016-09-11T19:30:28-0400", "Site_Abort_or_Cancel_"=>"false", "TCIVD"=>"2016-09-11T19:30:28-0400", "Check_In_Location_Verified"=>"lat=39.63346855, long=-75.66046963, alt=-16.0, accuracy=19.0"}], "Bob_Evan_s"=>[{"Number_of_POS"=>"6", "Number_of_Receipt_Printers"=>"7", "Number_of_Kitchen_Monitors"=>"7", "Number_of_Remote_Printers"=>"1", "Number_of_Cash_Drawers"=>"4", "Fileserver_Serial_Number"=>"03307000302125", "Security_Key_Number"=>"272533", "Install_Night"=>"2", "Bob_Evan_s_Night_2"=>[{"Lexmark_MAC_Address"=>"0021b71903b4", "Repurposed_Kitchen_Printer_for_Carryout_Location_and_Type"=>"markiv expo to carry out "}], "Night_1_Pictures"=>"", "Night_2_Pictures"=>[{"POS_1"=>"IMAGE", "POS_1_under"=>"IMAGE", "POS_2"=>"IMAGE", "POS_2_under"=>"IMAGE", "POS_3"=>"IMAGE", "POS_3_under"=>"IMAGE", "POS_5"=>"IMAGE", "POS_5_under"=>"IMAGE", "POS_6"=>"IMAGE", "POS_6_Under"=>"IMAGE", "POS_7"=>"IMAGE", "POS_7_under"=>"IMAGE", "Carryout"=>"IMAGE", "FC_Customer"=>"IMAGE", "FC_Employee"=>"IMAGE", "Prep_counter"=>"IMAGE", "Grill_Left"=>"IMAGE", "Grill_Right"=>"IMAGE", "Meat_1"=>"IMAGE", "Egg_1"=>"IMAGE", "Meat_2"=>"IMAGE", "Egg_2"=>"IMAGE", "Salad"=>"IMAGE", "Expo_1"=>"IMAGE", "Expo_2"=>"IMAGE", "Network_Closet"=>"IMAGE", "Patch_panel"=>"IMAGE", "POE"=>"IMAGE", "D_Mark"=>"IMAGE", "MWS"=>"IMAGE", "CyberPower"=>"IMAGE", "Office_Network_Jacks"=>"IMAGE", "Server"=>"IMAGE", "BOH_Overall"=>"IMAGE", "Caller_ID"=>"IMAGE", "SEKO_Boxes"=>"IMAGE", "CORP_Boxes"=>"IMAGE"}]}], "SO"=>[{"NOI"=>"2", "LT"=>"Justin Berryman ", "HT1"=>[{"HT1"=>"levie", "LT"=>"Justin Berryman ", "SD"=>"2016-09-11", "TTR"=>"2016-09-12T03:38:20-0400", "MOD"=>"Tammy", "NOI"=>"2", "STON"=>"300", "TCIV"=>"2016-09-11T19:30:28-0400", "TTOS"=>"8.13", "City"=>"BEAR", "LTWON"=>"600168", "State"=>"Delaware", "LTSTS"=>"2016-09-12T03:38:14-0400", "MODSTS"=>"2016-09-12T04:21:11-0400", "Status"=>"Complete- With Outstanding Issues", "Purpose"=>"IMAC", "Industry"=>"HSR", "Zip_Code"=>"19701-3051", "Customer"=>"BOB EVANS FARMS LLC", "Site_Name"=>"BOB EVANS", "Lead_Tech"=>"Justin Berryman ", "Closed_Issues"=>"none", "Street_Address"=>"1301 GOVERNORS PL", "Outstanding_Issues"=>"none", "Site_Abort_or_Cancel_"=>"false"}], "Status"=>"Complete- With Outstanding Issues", "Outstanding_Issues"=>"edc's not working currently escalated and will be fixed promptly", "Closed_Issues"=>"none", "MOD"=>"Tammy", "MODS"=>"IMAGE", "LTS"=>"IMAGE", "TTR"=>"2016-09-12T03:38:20-0400", "TTOS"=>"8.13", "Your_Email_Address"=>"justinberryman1@gmail.com", "TTRD"=>"2016-09-12T03:38:20-0400", "LTSTS"=>"2016-09-12T03:38:14-0400", "MODSTS"=>"2016-09-12T04:21:11-0400", "Check_Out_Location"=>"lat=39.63341509, long=-75.66064347, alt=-18.0, accuracy=214.0"}], "Pics"=>[{"PIC1"=>"IMAGE", "PIC2"=>"IMAGE", "PIC3"=>"IMAGE", "PIC4"=>"IMAGE", "PIC5"=>"IMAGE", "PIC6"=>"IMAGE", "PIC7"=>"IMAGE", "PIC8"=>"IMAGE", "PIC9"=>"IMAGE", "PIC10"=>"IMAGE", "PIC11"=>"IMAGE", "PIC12"=>"IMAGE"}]}}

      expect(rule.object_matches_rules?(object)).to eq(true)
    end
  end
end

