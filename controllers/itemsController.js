const Item = require("./../models/itemModel");

exports.getItems = async (req, res) => {
  const items = await Item.find();
  res.status(200).json({
    status: "success",
    data: {
      items,
    },
  });
};

exports.postItem = async (req, res) => {
  const item = await Item.create(req.body.item);
  res.status(201).json({
    status: "success",
    data: { item },
  });
};
