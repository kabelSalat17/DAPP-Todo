pragma solidity ^0.5.0;

contract TodoList {
    uint public taskCount = 0; //state variable //rappresent the state of this smart contract on the Blockchain

    //define the structure of Task
    struct Task {
        uint id; //id can't be negative
        string content;
        bool completed;
    }

    mapping(uint => Task) public tasks; //associative array uint is a id and the Task will be the Task //tasks new state variable

    event TaskCreated( //create event task created //now it is availible in smart contract //call the line at line28
        uint id,
        string content,
        bool completed
    );

    event TaskCompleted(
        uint id,
        bool completed
    );

    constructor() public{ //function runs only first time
        createTask("Default task");
    }

    function createTask(string memory _content) public { //provide single argument that is content
        taskCount ++;
        tasks[taskCount] = Task(taskCount, _content, false); //new task has taskcount, content and not completed yet
        emit TaskCreated(taskCount, _content, false);

    }

    function toggleCompleted(uint _id ) public {
        Task memory _task = tasks[_id]; //underscore is local var
        _task.completed = !_task.completed; //toggle
        tasks[_id] = _task;
        emit TaskCompleted(_id, _task.completed);
    }
}