const mongoose = require("mongoose");

const stockItemSchema = mongoose.Schema({
  itemId: {
    type: String,
    required: true,
  },
  quantity: {
    type: Number,
    default: 0,
    min: 0,
  },
  unitSalePrice: {
    type: Number,
    min: 0,
    default: 0,
  },
  unitBuyPrice: {
    type: Number,
    min: 0,
    default: 0,
  },
});

const StockItem = mongoose.model("StockItem", stockItemSchema);

module.exports = StockItem;
