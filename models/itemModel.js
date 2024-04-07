const mongoose = require("mongoose");

const itemSchema = mongoose.Schema({
  name: {
    type: String,
    trim: true,
    required: true,
  },
  capacity: {
    type: Number,
    required: true,
    min: 0,
  },
  capacityUnit: {
    type: String,
    enum: ["cl", "ml", "l"],
    required: true,
  },
  bottlesNumber: {
    type: Number,
    min: 1,
    required: true,
  },
});

itemSchema.pre("save", function (next) {
  this.name = this.name
    .toLowerCase()
    .split(" ")
    .map((noun) => noun[0].toUpperCase() + noun.slice(1))
    .join(" ");
  next();
});

itemSchema.index({ name: 1, capacity: 1, bottlesNumber: 1 }, { unique: true });

const Item = mongoose.model("Item", itemSchema);

module.exports = Item;
