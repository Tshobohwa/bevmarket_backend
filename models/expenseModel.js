const mongoose = require("mongoose");

const expenseSchema = mongoose.Schema({
  reason: {
    type: String,
    required: true,
    trim: true,
  },
  amount: {
    type: Number,
    required: true,
    min: 0,
  },
  createdAt: {
    type: String,
  },
  // currency: {
  //   type: String,
  //   required: true,
  //   enum: ["Fc"],
  //   trim: true,
  // },
});

expenseSchema.pre("save", function (next) {
  this.createdAt = new Date().toISOString();
  next();
});

const Expense = mongoose.model("Expense", expenseSchema);

module.exports = Expense;
