const { expect } = require("chai");

describe("Calculator", function () {
  let calculator;

  beforeEach(async function () {
    const Calculator = await ethers.getContractFactory("Calculator");
    calculator = await Calculator.deploy();
    await calculator.deployed();
  });

  it("should add two numbers correctly", async function () {
    await calculator.add(5, 3);
    expect(await calculator.getLastAdditionResult()).to.equal(8);
  });

  it("should subtract two numbers correctly", async function () {
    await calculator.subtract(10, 4);
    expect(await calculator.getLastSubtractionResult()).to.equal(6);
  });

  it("should multiply two numbers correctly", async function () {
    await calculator.multiply(7, 2);
    expect(await calculator.getLastMultiplicationResult()).to.equal(14);
  });

  it("should divide two numbers correctly", async function () {
    await calculator.divide(20, 5);
    expect(await calculator.getLastDivisionResult()).to.equal(4);
  });

  it("should handle division by zero", async function () {
    await expect(calculator.divide(10, 0)).to.be.revertedWith("Cannot divide by zero");
  });
});
