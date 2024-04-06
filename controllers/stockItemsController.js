const catchAsync = require("../utils/catchAsync");
const StockItem = require("../models/stockItemModel");

exports.postStockItem = catchAsync(async (req, res) => {
  const stockItem = await StockItem.create(req.body);

  res.status(201).json({
    status: "success",
    data: {
      stockItem,
    },
  });
});

exports.getStockItems = catchAsync(async (req, res) => {
  const stockItems = await StockItem.find();
  res.status(200).json({
    status: "success",
    data: {
      stockItems,
    },
  });
});
