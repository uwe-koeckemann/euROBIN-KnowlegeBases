:- multifile scenario/1.
:- multifile sequence/2.
:- multifile switch/3.
:- multifile option/2.
:- multifile objectType/2.
:- multifile actionInstance/3.
:- multifile forEach/3.

scenario('Aerial_Delivery_1').
scenario('Aerial_Delivery_2').
scenario('Long_Distance_Navigation_1').
scenario('Long_Distance_Navigation_2').
scenario('Ground_Delivery_1').
scenario('Ground_Delivery_and_Assistance_1').

objectType('Object_KB', 'KnowledgeBase').
objectType('User_KB', 'KnowledgeBase').
objectType('Robot_KB', 'KnowledgeBase').

sequence('Aerial_Delivery_1',
         ['Move_to_Supply_Location',
          'Find_Object_Aerial',
          'Take_Object_Aerial',
          'Move_to_Aerial_Delivery_Location',
          'Ask_to_Take_Aerial_Parcel',
          'Hand_Over_Aerial_Parcel']).

sequence('Ground_Delivery_1',
         ['Move_to_Transporter_Platform',
          'Find_Object_Platform',
          'Take_Object_Platform',
          'Move_to_Ground_Delivery_Location',
          'Ask_to_Take_Ground_Parcel',
          'Hand_Over_Ground_Parcel']).

sequence('Ground_Delivery_and_Assistance_1',
         ['Take_Tools_and_Objects',
          'Move_to_Workspace',
          'Deliver_Tools_and_Objects',
          'Assist']).

loop('Aerial_Delivery_2',
     ['Wait_for_Request',
      'Update_Object_KB',
      'Update_User_KB',
      'Update_Robot_KB',
      'Aerial_Delivery_1']).

forEach('Take_Tools_and_Objects',
        'Requested_Item',
        ['Find_Requested_Item',
         'Take_Requested_Item',
         'Store_Requested_Item']).

actionInstance('Long_Distance_Navigation_1', 'Navigate', ['Long_Distance_Goal_1']).
actionInstance('Long_Distance_Navigation_2', 'Navigate', ['Long_Distance_Goal_2']).
actionInstance('Move_to_Supply_Location', 'Navigate', ['Aerial_Supply_Location']).
actionInstance('Move_to_Transport_Platform', 'Navigate', ['Transporter_Platform']).
actionInstance('Move_to_Ground_Delivery_Location', 'Navigate', ['Aerial_Delivery_Location_1']).
actionInstance('Move_to_Aerial_Delivery_Location', 'Navigate', ['Ground_Delivery_Location_1']).
actionInstance('Find_Object_Aerial', 'Recognize_Objects', ['Aerial_Parcel_1']).
actionInstance('Find_Object_Ground', 'Recognize_Objects', ['Ground_Parcel_1']).
actionInstance('Take_Object_Aerial', 'Pick', ['Aerial_Parcel_1']).
actionInstance('Take_Object_Ground', 'Pick', ['Ground_Parcel_1']).
actionInstance('Ask_to_Take_Aerial_Parcel',
               'Interact',
               ['QueryAction', 'Human_1', 'HandOver', 'Aerial_Parcel_1']).
actionInstance('Hand_Over_Aerial_Parcel', 'Hand_Over', ['Aerial_Parcel_1', 'Human_1']).
actionInstance('Ask_to_Take_Ground_Parcel',
               'Interact',
               ['QueryAction', 'Human_1', 'HandOver', 'Ground_Parcel_1']).
actionInstance('Hand_Over_Ground_Parcel', 'Hand_Over', ['Ground_Parcel_1', 'Human_1']).

actionInstance('Update_Object_KB', 'KB_Update', ['Object_KB']).
actionInstance('Update_User_KB', 'KB_Update', ['User_KB']).
actionInstance('Update_Robot_KB', 'KB_Update', ['Robot_KB']).

actionInstance('Find_Requested_Item', 'Recognize_Objects', ['Item_1']).
actionInstance('Take_Requested_Item', 'Pick', ['Item_1', 'Robot_Storage_1']).
actionInstance('Store_Requested_Item', 'Place', ['Item_1', 'Robot_Storage_1']).
