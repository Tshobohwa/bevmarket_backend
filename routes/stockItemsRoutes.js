const express = require("express");
const stockItemController = require("../controllers/stockItemsController");

const router = express.Router();

router
  .route("/")
  .get(stockItemController.getStockItems)
  .post(stockItemController.postStockItem)
  .delete(stockItemController.deleteAllStockItems);

router.route("/:id").put(stockItemController.updateStockItem);

module.exports = router;
