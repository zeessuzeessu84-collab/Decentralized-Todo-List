// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TodoList {
    struct Task {
        uint256 id;
        string content;
        bool completed;
    }

    // Har user ki apni task list hogi
    mapping(address => Task[]) private userTasks;
    uint256 public taskCounter;

    event TaskCreated(address user, uint256 id, string content);
    event TaskCompleted(address user, uint256 id);

    // Naya task add karne ke liye
    function createTask(string memory _content) public {
        taskCounter++;
        userTasks[msg.sender].push(Task(taskCounter, _content, false));
        emit TaskCreated(msg.sender, taskCounter, _content);
    }

    // Task status update karne ke liye
    function toggleCompleted(uint256 _index) public {
        require(_index < userTasks[msg.sender].length, "Task does not exist");
        Task storage task = userTasks[msg.sender][_index];
        task.completed = !task.completed;
        emit TaskCompleted(msg.sender, _index);
    }

    // User ke saare tasks dekhne ke liye
    function getMyTasks() public view returns (Task[] memory) {
        return userTasks[msg.sender];
    }
}
