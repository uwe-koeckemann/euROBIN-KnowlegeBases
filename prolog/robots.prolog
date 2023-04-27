robot(R) :- capability(R, _, _).

% Manufacturing Robots
capability('WP1_Robot', 'Pick', ['Key', 'Key_Holder']).
capability('WP1_Robot', 'Pick', ['Key', 'Key_Hole']).
capability('WP1_Robot', 'Place', ['Key', 'Key_Hole']).
capability('WP1_Robot', 'Pick', ['Battery', 'Battery_Holder']).
capability('WP1_Robot', 'Place', ['Battery', 'Battery_Box']).
capability('WP1_Robot', 'Pick', ['Battery_Box_Lid', 'Battery_Box']).
capability('WP1_Robot', 'Place', ['Battery_Box_Lid', 'Battery_Box']).
capability('WP1_Robot', 'Localize_Object', ['Button']).
capability('WP1_Robot', 'Push', ['Button']).

% Personal Robots
capability('WP2_Robot', 'Listen_to', ['Human']).
capability('WP2_Robot', 'Navigate', ['IndoorPose']).
capability('WP2_Robot', 'Open', ['Door']).
capability('WP2_Robot', 'Close', ['Door']).
capability('WP2_Robot', 'Interact', ['Human', 'Query_Action']).
capability('WP2_Robot', 'Accept_Hand_Over', ['Box', 'Human']).
capability('WP2_Robot', 'Hand_Over', ['Small_Object', 'Human']).
capability('WP2_Robot', 'Open', ['Box']).
capability('WP2_Robot', 'Pick', ['Small_Object', 'Dishwasher']).
capability('WP2_Robot', 'Pick', ['Small_Object', 'Box']).
capability('WP2_Robot', 'Place', ['Small_Object', 'Table']).
capability('WP2_Robot', 'Pick', ['Soft_Object', 'Washing_Machine']).
capability('WP2_Robot', 'Place', ['Shirt', 'Coat_Hanger']).
capability('WP2_Robot', 'Place', ['Coat_Hanger', 'Coat_Hanger_Rack']).
capability('WP2_Robot', 'Fold', ['Towel', 'Table']).
capability('WP2_Robot', 'Open', ['Dishwasher']).
capability('WP2_Robot', 'Close', ['Dishwasher']).
capability('WP2_Robot', 'Open', ['Washing_Machine']).
capability('WP2_Robot', 'Close', ['Washing_Machine']).
capability('WP2_Robot', 'Open', ['Fridge']).
capability('WP2_Robot', 'Close', ['Fridge']).
capability('WP2_Robot', 'Operate_Device', ['Washing_Machine']).
capability('WP2_Robot', 'Operate_Device', ['Dishwasher']).

% Outdoor Robots
capability('USE_Aerial',  'Localize_Object', ['Parcel']).
capability('USE_Aerial',  'Pick', ['Parcel']).
capability('USE_Aerial',  'Place', ['Parcel']).
capability('USE_Aerial',  'Hand_Over', ['Parcel', 'Human']).
capability('USE_Aerial',  'Recognize_Gesture', ['Human']).

capability('ETH_Wheel-legged', 'Navigate', ['Outdoor']).
capability('ETH_Wheel-legged', 'Navigate', ['Indoor']).

capability('IIT_Mobile_Manipulator', 'Localize_Object', ['Parcel']).
capability('IIT_Mobile_Manipulator', 'Localize_Object', ['Tool']).
capability('IIT_Mobile_Manipulator', 'Pick', ['Tool']).
capability('IIT_Mobile_Manipulator', 'Pick', ['Small_Object']).
capability('IIT_Mobile_Manipulator', 'Pick', ['Parcel_']).
capability('IIT_Mobile_Manipulator', 'Place', ['Tool']).
capability('IIT_Mobile_Manipulator', 'Place', ['Small_Object']).
capability('IIT_Mobile_Manipulator', 'Place', ['Parcel_']).
capability('IIT_Mobile_Manipulator', 'Hand_Over', ['Tool', 'Human']).
capability('IIT_Mobile_Manipulator', 'Hand_Over', ['Small_Object', 'Human']).
capability('IIT_Mobile_Manipulator', 'Hand_Over', ['Parcel_', 'Human']).
capability('IIT_Mobile_Manipulator', 'Interact', ['Human', 'Query_Action']).
