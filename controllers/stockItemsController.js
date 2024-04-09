const catchAsync = require("../utils/catchAsync");
const StockItem = require("../models/stockItemModel");
const Item = require("../models/itemModel");

exports.postStockItem = catchAsync(async (req, res) => {
  const {
    name,
    bottlesNumber,
    capacity,
    capacityUnit,
    quantity,
    unitBuyPrice,
    unitSalePrice,
  } = req.body.stockItem;

  const item = await Item.create({
    name,
    bottlesNumber,
    capacity,
    capacityUnit,
  });

  if (!item) {
    res.status(422).json({
      status: "fail",
      message: "Item already exists",
    });
    return;
  }

  const stockItem = await StockItem.create({
    item: item._id,
    quantity,
    unitBuyPrice,
    unitSalePrice,
  });

  res.status(201).json({
    status: "success",
    data: {
      item,
      stockItem,
    },
  });
});

exports.getStockItems = catchAsync(async (req, res) => {
  const stockItems = await StockItem.find().populate("item");
  res.status(200).json({
    status: "success",
    data: {
      stockItems,
    },
  });
});

exports.updateStockItem = catchAsync(async (req, res) => {
  const { id } = req.params;
  const { updates } = req.body;

  const oldStockItem = await StockItem.findById(id);

  if (!oldStockItem)
    return res.status(404).json({
      status: "fail",
      message: `No stock item with id ${id}`,
    });

  const quantity = oldStockItem.quantity + (updates.quantity || 0);
  const unitBuyPrice =
    (oldStockItem.quantity * oldStockItem.unitBuyPrice +
      (updates.unitBuyPrice || 0) * (updates.quantity || 0)) /
    quantity;
  const unitSalePrice = updates.unitSalePrice;

  const newItem = { ...oldStockItem, quantity, unitBuyPrice, unitSalePrice };

  const stockItem = await StockItem.findOneAndUpdate({ _id: id }, newItem, {
    new: true,
  });

  res.status(200).json({
    status: "success",
    data: {
      stockItem,
    },
  });
});

exports.deleteAllStockItems = catchAsync(async (req, res) => {
  await StockItem.deleteMany();
  await Item.deleteMany();
  res.status(204).json({
    status: "success",
    message: "stockItems successfuly deletetd",
  });
});
