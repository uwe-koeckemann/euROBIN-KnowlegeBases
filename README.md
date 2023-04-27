# euROBIN Scenario Knowledge Bases

This repository contains a collection of Knowledge Bases (KBs) created for
various robotics challenges defined in the [euROBIN
project](https://www.eurobin-project.eu/).  The euROBIN project proposed three
robotics challenge tracks for manufacturing (WP 1), personal robotics (WP 2),
and outdoor robotics (WP 3).  As part of WP6, we transform the challenge
descriptions into knowledge bases (KBs) in order to allow reasoning on tasks,
their actions and their resulting requirements.

These knowledge bases are written in Prolog and intend to represent closely the
scenario descriptions found in deliverables D1.1, D2.1, and D3.1 in a common
format.  Ideally, a robot that has never seen a challenge should be able to
determine if it is capable of everything required and extract the required tasks
and sub-tasks to perform the challenge itself.

The resulting knowledge base can be used to formulate queries to answer question
such as:

- Which actions are required by a scenario?
  - Example: Scenario X requires Pick, Place, Navigation, and Object Recognition
- Which object types do actions need to support?
  - Example: Scenario X requires Pick and Place actions on objects of type
    Bottle and Fruit
- What sub-tasks are required by a challenge?
- Can a given a robot perform the tasks required by a scenario

## Usage

1. Install [SWI Prolog](https://www.swi-prolog.org/) or another Prolog interpreter
2. Clone this repository
3. Open a command-line in this folder and run the following command:

        swipl -l prolog/*.prolog

4. Now you can enter queries to the knowledge base. 

  - To find all robots capable of opening a fridge:

        capability(R, 'Open', ['Fridge']).
    
  - To find all robots that can interact with a Human and the type of
    interaction:
    
        capability(R, 'Interact', ['Human', T]).

Note: If there are multiple answers, press `;` to get the next one or `.` to
stop.

## Scenarios

Scenario descriptions revolve around tasks that are either broken down into
sub-tasks (such as sequences, conditionals, or loops) or are handled by action
instances. Through action instances tasks are related to objects. Objects that
types that can be used to link tasks to requirements on actions and object
types.

- `task/1` identifies a task
- `scenario/1` identifies a scenario. Each scenario is also a task broken down
  by the following predicates.
- `actionInstance/3` describes instances of action with concrete parameters
  - Instance name (used by sub-tasks)
  - Action name (general name for a class of action)
  - Parameters (objects on which the action is executed)
- `sequence/2` breaks a task down into a sequence of sub-tasks that are either
  action instances or tasks
  - Task name
  - List of sub-tasks (described via `task/1` or `acion/3`)
- `loop/2` marks a task as an infinite loop
  - Name of the loop task
  - Sub-tasks to be looped
- `forEach/3` models tasks that are executed for each item in a collection
  - Task name
  - Item name
  - Sub-tasks requiring item
- `option/2` is a task realized by one of several options
  - Task name
  - List of choices that accomplish the task
- `doIf/3` is a task that depends on a condition
  - Task name
  - Condition variable
  - Sub-tasks executed if condition is true
- `duUntil/3` task executed until a condition becomes true
  - Task name
  - Condition variable
  - Sub-tasks executed as long as condition is `false`
- `objectInvolved/2` states that an object is involved in a task
- `requiredBy/2` states that an action is required by a task

### WP1: Manufacturing Challenges

Challenge uses a board that requires manipulation of small object such as keys,
probes, batteries, or cables.

For these scenarios we added a few predicates not used in the other challenges
as of yet:

- `fits/2` connects objects and places on the board that they can be fit on
- `mountedOn/2` describes that one object is mounted on another and is used to
  describe the challenge boards
- `dimentions/5` describes the dimensions of objects in a challenge
  - Scenario name
  - Object name
  - Length in cm
  - Width in cm
  - Height in cm
    

### WP2: Personal Robotics Challenges

Four scenarios that cover accepting a delivery, handling hard and soft objects,
and cooperation with humans in the environment,

### WP3: Outdoor Robots for Sustainable Communities

Two scenarios for aerial delivery, two scenarios for long distance ground
navigation, and two mobile manipulation scenarios.

## Robots

This knowledge base describes robots through their capabilities. For WP1 and WP2
no concrete robots were suggested by the deliverable. In these cases we added a
place-holder robot that has the capabilities required by the respective
scenarios.

- `robot/1` property identifying an object as a robot
- `capability/3` states that a robot can perform an action on a combination of
  object classes
  - Robot name
  - Action name
  - Object classes that the robot can perform the action with

# Known Issues

- Scenarios may require repeated execution of tasks on unknown lists of
  objects. This is not very clearly represented.
  
- Some scenarios require additional skills in their description but the
  difference is not visible int he current task description.
  
- Differences between aerial and ground robot requirements are lost since the
  basic action is `Navigate` in either case.
  
- Task descriptions currently do not include the robot as an object. This means
  we cannot restrict certain tasks to robots with required supporting features
  (e.g., aerial, ground).
  
# Other Knowledge Bases and Ontologies

This section collects other knowledge bases and ontologies that are not directly
connected to euROBIN.

- Objects and activities 
  - [Socio-physical Model of Activities (SOMA)](https://ease-crc.github.io/soma/)
  
- Environments
  - https://github.com/code-iai/iai_maps
- Robots
  - https://github.com/knowrob/knowrob/tree/master/owl/robots

# Acknowledgments

This project is funded by the project [euROBIN](https://www.eurobin-project.eu/)
under the European Union's Horizon Europe Framework Programme under grant
agreement No 101070596.
