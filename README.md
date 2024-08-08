# to_do_list

A To do list app Connected with Firebase uses Riverpod and can Perform CRUD operations

## WHAT APP DOES & HOw it Does
# 1. HomeScreen (Homepage)
**Purpose:** Displays a list of tasks and provides functionality to delete tasks and navigate to the "Add Task" screen.

**Scaffold:** The main visual structure of the screen.

**AppBar:** Displays the title "Todo List".
ListView.builder:
**itemCount:** Represents the total number of tasks in the list.
**itemBuilder:** Builds each list item using the Dismissible widget and TaskTile.
**Dismissible Widget**:

Allows tasks to be swiped to the left for deletion.
key: Unique identifier for each task to manage its state.
direction: Specifies swipe direction allowed.
onDismissed: Removes the task from the Firestore and updates the local state.
background: Red background with a delete icon displayed behind the swiped item.
child: Displays each task using TaskTile.
FloatingActionButton:

onPressed: Navigates to the "Add Task" screen when pressed.
child: Add icon indicating the action to add a new task.
Interaction with Other Components:

TaskTile: Used within Dismissible to render each task.
taskProvider: Provides the current list of tasks and handles state updates for tasks.
# 2. AddTaskScreen
Purpose: Allows users to add a new task to the list.

Scaffold: Provides the visual structure for the screen.
AppBar: Displays the title "Add Task".
body:
Padding: Adds padding around the content.
Column: Organizes the widgets vertically.
TextField:
controller: Manages the input text for the new task.
decoration: Labels the input field as "Task".
ElevatedButton:
onPressed: Calls _addTask when pressed.
child: Displays the text "Add Task".
Functionality:

_addTask Method:
Reads the input text from _taskController.
Creates a new TaskModel instance with the current timestamp as the ID and the input text as the task title.
Uses the Riverpod taskProvider to add the task to Firestore and update the local state.
Navigates back to the previous screen.
Interaction with Other Components:

taskProvider: Used to add the new task and update the state.
# 3. TaskTile
Purpose: Renders a single task with a checkbox, title, and delete button.

ListTile: A widget for displaying a single item in a list.
title: Displays the task title with a line-through style if the task is done.
leading:
Checkbox:
value: Reflects the task’s completion status.
onChanged: Toggles the task’s completion status when the checkbox is changed.
trailing:
IconButton: A delete button for removing the task.
Functionality:

onChanged:
Updates the task’s completion status using TaskNotifier.
onPressed:
Deletes the task using TaskNotifier.
Interaction with Other Components:

taskProvider: Used to update and delete the task.
# 4. TaskModel
Purpose: Represents the structure of a task and provides methods for JSON serialization.

Constructor: Initializes a task with an ID, title, and completion status.
copyWith: Creates a new TaskModel instance with modified properties.
toMap: Converts the task to a map for Firestore storage.
fromMap: Creates a TaskModel instance from a map retrieved from Firestore.
toJson and fromJson: Methods for converting between JSON strings and TaskModel instances.
5. TaskNotifier
Purpose: Manages the state of tasks and provides methods to interact with Firestore.

TaskNotifier Constructor:

Initializes the state with an empty list and fetches existing tasks from Firestore.
Methods:

_fetchTasks: Retrieves tasks from Firestore and updates the state.
addTask: Adds a new task to Firestore and updates the state.
deleteTask: Removes a task from Firestore and updates the state.
updateTask: Updates a task’s properties in the local state.
toggleTaskDone: Toggles a task’s completion status, updates Firestore, and updates the state.
Interaction with Other Components:

taskProvider: Manages task state and interactions with Firestore.
## Summary of the App Flow
HomeScreen:

Displays a list of tasks.
Allows tasks to be deleted and their completion status to be toggled.
Navigates to the "Add Task" screen when the floating action button is pressed.
AddTaskScreen:

Provides a form to input and add a new task.
Updates Firestore and the local state when a task is added.
TaskTile:

Displays individual tasks with options to check/uncheck (complete/incomplete) or delete.
TaskModel:

Defines the structure and serialization of tasks.
TaskNotifier:

Manages the task list state, interacts with Firestore, and provides functionality for adding, updating, deleting, and toggling tasks.
Each part of the app interacts with the others through the taskProvider, ensuring that changes in task state are reflected across all relevant components.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
