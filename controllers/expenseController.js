const Expense = require("../models/expenseModel");

exports.getExpenses = async (req, res) => {
  const expenses = await Expense.find();
  res.status(200).json({
    status: "success",
    data: {
      expenses,
    },
  });
};

exports.postExpense = async (req, res) => {
  const expense = await Expense.create(req.body.expense);
  res.status(201).json({
    status: "success",
    data: {
      expense,
    },
  });
};
