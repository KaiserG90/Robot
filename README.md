#Toy Robot Simulator
The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units. There are no other obstructions on the table surface.
The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed. Create an application that can read in commands of the following form:

* **PLACE** X,Y,F 
* **MOVE**
* **LEFT** 
* **RIGHT**
* **REPORT**

**PLACE** will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST. The origin (0,0) can be considered to be the SOUTH WEST most corner. The ﬁrst valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence until a  valid PLACE command has been executed. **MOVE** will move the toy robot one unit forward in the direction it is currently facing. **LEFT** and **RIGHT** will rotate the robot 90 degrees in the speciﬁed direction without changing the position of the robot. **REPORT** will announce the X,Y and F of the robot. This can be in any form, but  standard output is sufficient. 
A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT 
and REPORT commands. 
Input can be from a file, or from standard input, as the developer chooses. Provide test data to exercise the application. 

*Constraints*: The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot. Any move that would cause the robot to fall must be ignored


##Usage
```
ruby main.rb PLACE 1,2,NORTH MOVE RIGHT MOVE REPORT
```

##Files
>1. table.rb contains the table and the piece classes
2. robot.rb contains the robot class
3. main.rb contains the mainRobot

##Info
>I chose to make Robot inherit from the generic Piece class. This way it's easy to add other kind of
pieces to the table in the future.
Piece is not instantiable. It has common methods that all the pieces share:
- place_on_table which puts the piece on the table
- check_on_table_exception which checks if the piece is on the table

>Robot inherits from Piece but has his own methods: move, right, left. I chose not to put these
methods in Piece class because it could be desirable for some pieces to move and turn differently
(by 2 units for example).
In the main.rb a table and a robot object are created and then the script reads from standard input
the commands.
The table uses a set to store the pieces on it. More pieces can be placed on the table.
