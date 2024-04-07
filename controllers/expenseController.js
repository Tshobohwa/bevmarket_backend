const Expense = require("../models/expenseModel");
const catchAsync = require("../utils/catchAsync");

exports.getExpenses = catchAsync(async (req, res) => {
  const expenses = await Expense.find();
  res.status(200).json({
    status: "success",
    data: {
      expenses,
    },
  });
});

exports.postExpense = catchAsync(async (req, res) => {
  console.req.body;
  const expense = await Expense.create(req.body.expense);
  res.status(201).json({
    status: "success",
    data: {
      expense,
    },
  });
});
