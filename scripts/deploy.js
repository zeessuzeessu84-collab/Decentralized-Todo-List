
const hre = require("hardhat");

async function main() {
  const Todo = await hre.ethers.getContractFactory("TodoList");
  const todo = await Todo.deploy();

  await todo.waitForDeployment();

  console.log("TodoList Contract deployed to:", await todo.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
