Tasks
=====

##Objectives
Learn basics of a custom model object used for data storage, and a singleton controller to manage that those objects.

##Part 1:

###Step 1: Create a Task Object
- Create a Task with properties:
  - Title (NSString strong)
  - Flag (BOOL assign)
  - Note (NSString strong)
  - CompletedDate (NSDate strong, readonly)
- And method:
  - -(void)markCompleted:(BOOL)completed
  
The markCompleted method should check and if completed == YES then it should set the date to now, otherwise it should set the date to nil.


###Step 2: Create a TaskController Object
- Create a TaskController with properties:
  - Tasks (NSArray strong, readonly)
- And methods:
  - +(TaskController *)sharedInstance
  - -(void)addTask:(Task *)task
  - -(void)removeTask:(Task *)task
  
The shared instance method should be defined to match the gist here:
https://gist.github.com/jkhowland/89e24b5fb6e1b5048eb5

The addTask method needs to create a mutable version of the controller's tasks array, add the task that's passed in, and then re-set the controller's Tasks array.

The removeTask method needs to do the reverse. It should create a mutable copy of the tasks array, remove the task that was passed in, and then re-set the controllers Tasks array.

##Part 2:

###Step 3: Add Dictionary Representations of Tasks
- Add two methods to the header of Task
  - -(NSDictionary *)taskDictionary
  - -(id)initWithDictionary:(NSDictionary *)dictionary
- Add the methods to the implementation file
- Add a const key for each of the properties (i.e. titleKey, flagKey)
- In the dictionary method create a mutable dictionary and then add each of the properties for their key
  - Note: You can't insert a nil object. So you'll want to check those objects before you add them
  - if (title != nil) { [dictionary addObject:title forKey:titleKey] }
- In the init method you'll set the properties to the values for keys from the dictionary


###Step 4: Update the controller to store the dictionary Tasks to NSUserDefaults
- Update the setter method of Tasks array
  - Store the tasks array in _tasks
  - Create a new mutable array
  - Iterate through the tasks and convert each one to a dictionary
  - Add that dictionary to the mutable array
  - Store the new array of dictionaries to NSUserDefaults
- Update the sharedInstance method
  - Get the array of dictionaries from NSUserDefaults
  - Create a new mutable array
  - Iterate through the list of dictionaries, convert each one to a task and add to the mutable array
  - Set self.tasks to the mutable array






