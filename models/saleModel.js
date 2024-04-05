const mongoose = require("mongoose");

const saleSchema = mongoose.Schema({
  client: {},
  items: {},
  createdAt: {
    type: String,
  },
});

saleSchema.pre("save", function (next) {
  this.createdAt = new Date().toISOString;
  next();
});

const Sale = mongoose.model("Sale", saleSchema);

module.exports = Sale;
