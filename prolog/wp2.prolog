:- multifile scenario/1.
:- multifile sequence/2.
:- multifile switch/3.
:- multifile option/2.
:- multifile objectType/2.
:- multifile actionInstance/3.
:- multifile forEach/3.

scenario('Personal_Challenge_Year_1').
scenario('Personal_Challenge_Year_2').
scenario('Personal_Challenge_Year_3').
scenario('Personal_Challenge_Year_4').

% Year 1 Scenario 
objectType('Parcel_1', 'Box').
objectType('Door_1', 'Door').
objectType('Table_1', 'Table').
objectType('Human_1', 'Human').
objectType('Delivery_Person_1', 'Human').
% Year 2 Scenario 
objectType('Mug_1', 'Mug').
objectType('Mug_2', 'Mug').
objectType('Knife_1', 'Knife').
objectType('Fork_1', 'Fork').
objectType('Spoon_1', 'Spoon').
objectType('Plate_1', 'Plate').
objectType('Plate_2', 'Plate').
objectType('Mug', 'Small_Object').
objectType('Mug', 'Hard_Object').
objectType('Spoon', 'Small_Object').
objectType('Spoon', 'Hard_Object').
objectType('Fork', 'Small_Object').
objectType('Fork', 'Hard_Object').
objectType('Knife', 'Small_Object').
objectType('Knife', 'Hard_Object').
objectType('Plate', 'Small_Object').
objectType('Plate', 'Hard_Object').
objectType('Dishwasher_1', 'Dishwasher').
% Scenario 3
objectType('Washing_Machine_1', 'Washing_Machine').
objectType('Coat_Rack_1', 'Coat_Rack').
objectType('Coat_Hanger_1', 'Coat_Hanger').
objectType('Towel_1', 'Towel').
objectType('Sheet_1', 'Sheet').
objectType('Towel', 'Soft_Object').
objectType('Sheet', 'Soft_Object').
objectType('Shirt', 'Soft_Object').

% Scenario 1
sequence('Personal_Challenge_Year_1',
         ['Wait_For_Command',
          'Move_To_Door',
          'Open_Door',
          'Interact_with_Delivery_Person',
          'Receive_Parcel',
          'Move_To_Table',
          'Place_Parcel',
          'Open_Parcel',
          'Empty_Parcel']).

% Scenario 2
sequence('Personal_Challenge_Year_2',
         ['Wait_For_Command',
          'Fill_Dishwasher',
          'Start_Dishwasher',
          'Empty_Dishwasher']).
sequence('Fill_Dishwasher',
         ['Fill_Cutlery',
          'Fill_Mugs',
          'Fill_Dishes']).
sequence('Empty_Dishwasher',
         ['Empty_Cutlery',
          'Empty_Mugs',
          'Empty_Dishes']).
sequence('Fill_Mugs',
         ['Pick_Mug_1',
          'Place_Mug_1',
          'Pick_Mug_2',
          'Place_Mug_2']).
sequence('Fill_Cutlery',
         ['Pick_Knife_1',
          'Place_Knife_1',
          'Pick_Fork_1',
          'Place_Fork_1',
          'Pick_Spoon_1',
          'Place_Spoon_1']).
sequence('Fill_Dishes',
         ['Pick_Plate_1',
          'Place_Plate_1',
          'Pick_Plate_2',
          'Place_Plate_2']).
sequence('Empty_Mugs',
         ['Pick_Clean_Mug_1',
          'Hand_Over_Mug_1',
          'Pick_Clean_Mug_2',
          'Hand_Over_Mug_2']).
sequence('Empty_Cutlery',
         ['Pick_Clean_Knife_1',
          'Hand_Over_Knife_1',
          'Pick_Clean_Fork_1',
          'Hand_Over_Fork_1',
          'Pick_Clean_Spoon_1',
          'Hand_Over_Spoon_1']).
sequence('Empty_Dishes',
         ['Pick_Clean_Plate_1',
          'Hand_Over_Plate_1',
          'Pick_Clean_Plate_2',
          'Hand_Over_Plate_2']).

% Scenario 3
sequence('Personal_Challenge_Year_4',
         ['Wait_For_Command',
          'Move_To_Fridge',
          'Open_Fridge',
          'Fetch_Requested_Items',
          'Close_Fridge']).

forEach('Fetch_Requested_Items',
        'Requested_Item',
        ['Move_To_Fridge',
         'Find_Requested_Item',
         'Fetch_Requested_Item']).

switch('Find_Requested_Item',
       'Item_Type',
       [
           ['Juice_Box', 'Check_Bottle_Rack'],
           ['Bottle', 'Check_Bottle_Rack'],
           ['Vegetable', 'Check_Bottom_Rack'],
           ['Fruit', 'Check_Bottom_Rack']
       ]).

option('Fetch_Requested_Item',
       ['Grasp_and_Deliver_Requested_Item',
        'Ask_to_Fetch_Item']).

switch('Grasp_and_Deliver_Requested_Item',
       'Item_Type',
       [
           ['Juice_Box', 'Fetch_Juice_Box'],
           ['Bottle', 'Fetch_Bottle'],
           ['Vegetable', 'Fetch_Vegetable'],
           ['Fruit', 'Fetch_Fruit']
       ]).

sequence('Fetch_Juice_Box',
         ['Pick_Juice_Box',
          'Move_To_Table',
          'Place_Juice_Box']).
sequence('Fetch_Bottle',
         ['Pick_Bottle',
          'Move_To_Table',
          'Place_Bottle']).
sequence('Fetch_Vegetable',
         ['Pick_Vegetable',
          'Move_To_Table',
          'Place_Vegetable']).
sequence('Fetch_Fruit',
         ['Pick_Fruit',
          'Move_To_Table',
          'Place_Fruit']).

    
% Scenario 4
sequence('Personal_Challenge_Year_4',
         ['Wait_For_Command',
          'Move_To_Washing_Machine',
          'Assert_Washing_Machine_Door_Open',
          'Empty_Washing_Machine']).
sequence('Assert_Washing_Machine_Door_Open',
         ['Check_Washing_Machine_Door_State',
          'Open_Wachine_Machine_Door_If_Needed']).
sequence('Handle_Shirt',
         ['Move_To_Coat_Rack',
          'Pick_Hanger',
          'Put_Shirt_On_Hanger',
          'Hang_Shirt_On_Coat_Rack']).
sequence('Handle_Towel',
         ['Move_To_Table',
          'Put_Towel_On_Table',
          'Fold_Towel_On_Table']).
sequence('Handle_Sheet',
         ['Ask_To_Fold_Sheet',
          'Cooperative_Sheet_Folding']).

doUntil('Empty_Parcel',
        'Parcel_Empty',
        ['Select_Next_Object',
         'Pick_Next_Object',
         'Place_Next_Object']).
duUntil('Empty_Washing_Machine',
        'Washing_Machine_Empty',
        ['Pick_Item_From_Washing_Machine',
         'Determine_Soft_Object_Type',
         'Handle_Soft_Object']).    

doIf('Open_Wachine_Machine_Door_If_Needed',
     'Washing_Machine_Door_Closed',
     ['Open_Washing_Machine_Door']).

switch('Handle_Soft_Object',
       'Soft_Object_Type',
       [
           ['Shirt', 'Handle_Shirt'],
           ['Towel', 'Handle_Towel'],
           ['Sheet', 'Handle_Sheet']
       ]).

option('Open_Parcel', ['Ask_to_Open_Parcel', 'Open_Parcel_Without_Help']).
option('Open_Fridge', ['Ask_to_Open_Fridge', 'Open_Fridge_Without_Help']).


informationLink('Scan_Contents',
                'Parcel_Empty').
informationLink('Check_Washing_Machine_Door_State',
                'Washing_Machine_Empty').
informationLink('Check_Washing_Machine_Door_State',
                'Washing_Machine_Door_Close').
informationLink('Determine_Soft_Object_Type',
                'Soft_Object_Type').

% Scenario 1
actionInstance('Wait_for_Command', 'Listen_to', ['Human_1']).
actionInstance('MoveToDoor', 'Navigate', ['Door_1']).
actionInstance('OpenDoor', 'Open', ['Door_1']).
actionInstance('CloseDoor', 'Close', ['Door_1']).
actionInstance('Interact_with_Delivery_Person',
               'Interact',
               ['Query_Action', 'Delivery_Person_1', 'Hand_Over', 'Parcel_1']). 
actionInstance('Receive_Parcel', 'Accept_Hand_Over', ['Parcel_1', 'Delivery_Person_1']).
actionInstance('Move_to_Table', 'Navigate', ['Table_1']).
actionInstance('Place_Parcel', 'Place', ['Parce_1', 'Table_1']).
actionInstance('Ask_to_Open_Parcel', 'Interact', ['Query_Action', 'Human_1', 'Open', 'Parcel_1']).
actionInstance('Open_Parcel_Without_Help', 'Open', ['Parcel_1']).
actionInstance('Scan_Contents', 'Recognize_Objects', ['Parcel_1']).
actionInstance('Pick_Next_Object', 'Pick', ['*', 'Parcel_1']).
actionInstance('Place_Next_Object', 'Place', ['*', 'Table_1']).

% Scenario 2
actionInstance('Move_to_Dishwasher', 'Navigate', ['Dishwasher_1']).
actionInstance('Open_Dishwasher', 'Open', ['Dishwasher_1']).
actionInstance('Close_Dishwasher', 'Close', ['Dishwasher_1']).
actionInstance('Start_Dishwasher', 'Operate_Device', ['Dishwasher_1', 'Start']).
actionInstance('Ask_to_Open_Dishwasher',
               'Interact',
               ['Query_Action', 'Human_1', 'Open', 'Dishwasher_1']).
actionInstance('Ask_to_Close_Dishwasher',
               'Interact',
               ['Query_Action', 'Human_1', 'Close', 'Dishwasher_1']).
actionInstance('Ask_to_Start_Dishwasher',
               'Interact',
               ['Query_Action', 'Human_1', 'Start', 'Dishwasher_1']).
actionInstance('Pick_Mug_1', 'Pick', ['Mug_1', 'Table_1']).
actionInstance('Pick_Mug_2', 'Pick', ['Mug_2', 'Table_1']).
actionInstance('Pick_Knife_1', 'Pick', ['Knife_1', 'Table_1']).
actionInstance('Pick_Fork_1', 'Pick', ['Fork_1', 'Table_1']).
actionInstance('Pick_Spoon_1', 'Pick', ['Spoon_1', 'Table_1']).
actionInstance('Pick_Plate_1', 'Pick', ['Plate_1', 'Table_1']).
actionInstance('Pick_Plate_2', 'Pick', ['Plate_2', 'Table_1']).
actionInstance('Place_Mug_1', 'Place', ['Mug_1', 'Dishwasher_1']).
actionInstance('Place_Mug_2', 'Place', ['Mug_2', 'Dishwasher_1']).
actionInstance('Place_Knife_1', 'Place', ['Knife_1', 'Dishwasher_1']).
actionInstance('Place_Fork_1', 'Place', ['Fork_1', 'Dishwasher_1']).
actionInstance('Place_Spoon_1', 'Place', ['Spoon_1', 'Dishwasher_1']).
actionInstance('Place_Plate_1', 'Place', ['Plate_1', 'Dishwasher_1']).
actionInstance('Place_Plate_2', 'Place', ['Plate_2', 'Dishwasher_1']).
actionInstance('Pick_Clean_Mug_1', 'Pick', ['Mug_1', 'Dishwasher_1']).
actionInstance('Pick_Clean_Mug_2', 'Pick', ['Mug_2', 'Dishwasher_1']).
actionInstance('Pick_Clean_Knife_1', 'Pick', ['Knife_1', 'Dishwasher_1']).
actionInstance('Pick_Clean_Fork_1', 'Pick', ['Fork_1', 'Dishwasher_1']).
actionInstance('Pick_Clean_Spoon_1', 'Pick', ['Spoon_1', 'Dishwasher_1']).
actionInstance('Pick_Clean_Plate_1', 'Pick', ['Plate_1', 'Dishwasher_1']).
actionInstance('Pick_Clean_Plate_2', 'Pick', ['Plate_2', 'Dishwasher_1']).
actionInstance('Hand_Over_Mug_1', 'Hand_Over', ['Mug_1', 'Human_1']).
actionInstance('Hand_Over_Mug_2', 'Hand_Over', ['Mug_2', 'Human_1']).
actionInstance('Hand_Over_Knife_1', 'Hand_Over', ['Knife_1', 'Human_1']).
actionInstance('Hand_Over_Fork_1', 'Hand_Over', ['Fork_1', 'Human_1']).
actionInstance('Hand_Over_Spoon_1', 'Hand_Over', ['Spoon_1', 'Human_1']).
actionInstance('Hand_Over_Plate_1', 'Hand_Over', ['Plate_1', 'Human_1']).
actionInstance('Hand_Over_Plate_2', 'Hand_Over', ['Plate_2', 'Human_1']).

% Scenario 3
actionInstance('Move_To_Fridge', 'Navigate', ['Fridge_1']).
actionInstance('Open_Fridge', 'Open', ['Fridge_1']).
actionInstance('Pick_Fridge_Item', 'Pick', ['Item_1', 'Fridge_1']).
actionInstance('Pick_Juice_Box', 'Pick', ['Juice_Box_1', 'Fridge_1']).
actionInstance('Pick_Bottle', 'Pick', ['Bottle_1', 'Fridge_1']).
actionInstance('Pick_Vegetable', 'Pick', ['Vegetable_1', 'Fridge_1']).
actionInstance('Pick_Fuit', 'Pick', ['Fruit_1', 'Fridge_1']).
actionInstance('Place_Juice_Box', 'Place', ['Juice_Box_1', 'Table_1']).
actionInstance('Place_Bottle', 'Place', ['Bottle_1', 'Table_1']).
actionInstance('Place_Vegetable', 'Place', ['Vegetable_1', 'Table_1']).
actionInstance('Place_Fuit', 'Place', ['Fruit_1', 'Table_1']).
actionInstance('Ask_to_Open_Fridge',
               'Interact',
               ['Query_Action', 'Human_1', 'Open', 'Fridge_1']).

actionInstance('Ask_to_Fetch_Item',
               'Interact',
               ['Query_Action', 'Human_1', 'Fetch', 'Item_1']).

% Scenario 4
actionInstance('Move_To_Washing_Machine', 'Navigate', ['Washing_Machine_1']).
actionInstance('Move_To_Coat_Rack', 'Navigate', ['Coat_Rack_1']).
actionInstance('Check_Washing_Machine_Door_State',
               'Recognize_Objects',
               ['Washing_Machine_1']).
actionInstance('Ask_to_Open_Washing_Machine',
               'Interact',
               ['Query_Action', 'Human_1', 'Open', 'Washing_Machine_1']).
actionInstance('Open_Washing_Machine_Door', 'Open', ['Washing_Machine_1']).
actionInstance('Pick_Hanger', 'Pick', ['Coat_Hanger_1', 'Coat_Rack_1']).
actionInstance('Put_Shirt_On_Hanger', 'Place', ['Shirt_1', 'Coat_Hanger_1']).
actionInstance('Hang_Shirt_On_Coat_Rack', 'Place', ['Coat_Hanger_1', 'Coat_Rack_1']).
actionInstance('Fold_Towel_On_Table', 'Fold', ['Towel_1', 'Table_1']).
actionInstance('Ask_to_Fold_Sheet',
               'Interact',
               ['Query_Action', 'Human_1', 'FoldTogether', 'Sheet_1']).
actionInstance('Cooperative_Sheet_Folding',
               'Fold_With',
               ['Sheet_1', 'Human_1']).
          
