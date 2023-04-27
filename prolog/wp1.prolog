:- multifile scenario/1.
:- multifile sequence/2.

scenario('RGC2021').
scenario('RGC2023').

fits('RJ54_Plug', 'Ethernet_Ports').
fits('Key', 'Key_Switch').
fits('Key', 'Key_Holder').
fits('AA_Batteries', 'Recyclcing_Holes').
fits('AA_Batteries', 'Battery_Box').
fits('Tool', 'Tool_Holder').

mountedOn('RGC2021', 'Push_Buttons', 'Mounting_Plate').
mountedOn('RGC2021', 'Push_Button_Red', 'Push_Buttons').
mountedOn('RGC2021', 'Push_Button_Blue', 'Push_Buttons').
mountedOn('RGC2021', 'Key_Holder', 'Mounting_Plate').
mountedOn('RGC2021', 'Recycling_Hole_1', 'Mounting_Plate').
mountedOn('RGC2021', 'Recycling_Hole_2', 'Mounting_Plate').
mountedOn('RGC2021', 'CPU', 'Mounting_Plate').
mountedOn('RGC2021', 'Key_Switch', 'Mounting_Plate').
mountedOn('RGC2021', 'Ethernet_Port_A', 'Mounting_Plate').
mountedOn('RGC2021', 'Ethernet_Port_B', 'Mounting_Plate').
mountedOn('RGC2021', 'Battery_Box_Lid', 'Battery_Box_Lid').
mountedOn('RGC2021', 'Battery_Box', 'Mounting_Plate').
mountedOn('RGC2021', 'Battery_Box_Slot_1', 'Battery_Box').
mountedOn('RGC2021', 'Battery_Box_Slot_2', 'Battery_Box').
mountedOn('RGC2021', 'Mounting_Plate', 'Structural_Electronics_Box').

mountedOn('RGC2023', 'Push_Buttons', 'Mounting_Plate').
mountedOn('RGC2023', 'Push_Button_Red', 'Push_Buttons').
mountedOn('RGC2023', 'Push_Button_Blue', 'Push_Buttons').
mountedOn('RGC2023', 'Slider', 'Mounting_Plate').
mountedOn('RGC2023', 'Hinged_Door', 'Mounting_Plate').
mountedOn('RGC2023', 'Probe_Holder', 'Mounting_Plate').
mountedOn('RGC2023', 'Probe_Ports', 'Mounting_Plate').
mountedOn('RGC2023', 'Probe_Port_A', 'Plate_Ports').
mountedOn('RGC2023', 'Probe_Port_B', 'Plate_Ports').
mountedOn('RGC2023', 'Probe_Cable_Wrapper', 'Mounting_Plate').

dimensions('RGC2021', 'Structural_Electronics_Box', 300, 150, 80).
dimensions('RGC2021', 'Mounting_Plate', 300, 150, 1).

actionInstance('Localize_Button', 'Localize_Object',
       ['Push_Buttons',
        'Mounting_Plate']).
actionInstance('Push_Button', 'Push', ['Push_Button_Red']).
actionInstance('Pick_Key', 'Pick', ['Key', 'Key_Holder']).
actionInstance('Place_Key', 'Place', ['Key', 'Key_Switch']).
actionInstance('Pick_RJ45', 'Pick', ['RJ54_Plug', 'Ethernet_Plug_A']).
actionInstance('Place_RJ45', ['RJ54_Plug', 'Ethernet_Plug_B']).

actionInstance('Pick_Battery_1', ['Battery_1', 'Recyclcing_Hole_1']).
actionInstance('Pick_Battery_2', ['Battery_2', 'Recyclcing_Hole_2']).
actionInstance('Pick_Battery_Lid', ['Battery_Box_Lid', 'Battery_Box']).

actionInstance('Place_Battery_1', ['Battery_1', 'Battery_Box_Slot_1']).
actionInstance('Place_Battery_2', ['Battery_2', 'Battery_Box_Slot_2']).
actionInstance('Place_Battery_Lid', ['Battery_Box_Lid', 'Battery_Box']).

sequence('RGC2021',
           ['Press_Button_Localization',
            'Key_Switch_Insertion',
            'Ethernet_Plug_Insertion',
            'Extract_Battery_Disassembly',
            'Insert_Battery_Insertion',
            'Press_Button'
           ]).
sequence('RGC2023',
           ['Press_Button_Localization',
            'Press_Button',
            'Move_Slider',
            'Plug_Probe_into_Test_Port',
            'Open_Door',
            'Probe_Circuit',
            'Wrap_Cable',
            'Replace_Probe'
           ]).
sequence('Press_Button_Localization', ['Localize_Button']).
sequence('Key_Switch_Insertion',
         ['Pick_Key',
          'Place_Key']).
sequence('Ethernet_Plug_Insertion',
         ['Pick_RJ45',
          'Place_RJ45']).
sequence('Extract_Battery_Disassembly',
         ['Pick_Battery_1',
          'Pick_Battery_2']).
sequence('Insert_Battery_Insertion',
         ['Pick_Battery_Lid',
          'Place_Battery_1',
          'Place_Battery_2',
          'Place_Battery_Lid']).
sequence('Press_Button', ['Push_Button']).

% TODO: Replace by clause going through sub-tasks and action arguments
objectInvolved('Push_Buttons', 'Press_Button_Localization').
objectInvolved('Mounting_Plate', 'Press_Button_Localization').

objectInvolved('Key_Holder', 'Key_Switch_Insertion').
objectInvolved('Key_Switch', 'Key_Switch_Insertion').
objectInvolved('Key', 'Key_Switch_Insertion').

objectInvolved('Ethernet_Ports', 'Ethernet_Plug_Insertion').
objectInvolved('RJ54_Plug', 'Ethernet_Plug_Insertion').

objectInvolved('Recycling_Holes', 'Extract_Battery_Disassembly').
objectInvolved('AA_Batteries', 'Extract_Battery_Disassembly').

objectInvolved('Battery_Box', 'Insert_Battery_Insertion').
objectInvolved('Battery_Box_Lid', 'Insert_Battery_Insertion').
objectInvolved('AA_Batteries', 'Insert_Battery_Insertion').

objectInvolved('Push_Buttons', 'Press_Button').

% TODO: Replace by clause going through sub-tasks and action names
requireBy('Object_Localization', 'Press_Button_Localization').
requireBy('Pick_Object', 'Press_Button_Localization').
requireBy('Place_Object', 'Press_Button_Localization').

requireBy('Pick_Object', 'Key_Switch_Insertion').
requireBy('Place_Object', 'Key_Switch_Insertion').

requireBy('Pick_Object', 'Ethernet_Plug_Insertion').
requireBy('Place_Object', 'Ethernet_Plug_Insertion').

requireBy('Pick_Object', 'Extract_Battery_Disassembly').

requireBy('Pick_Object', 'Insert_Battery_Insertion').
requireBy('Place_Object', 'Insert_Battery_Insertion').

requireBy('Push_Object', 'Press_Button').

