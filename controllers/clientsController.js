const Client = require("./../models/clientModel");
const catchAsync = require("../utils/catchAsync");

exports.getClients = catchAsync(async (req, res) => {
  const clients = await Client.find();

  res.status(200).json({
    status: "success",
    data: {
      clients,
    },
  });
});

exports.postClient = catchAsync(async (req, res) => {
  const client = await Client.create(req.body.client);

  res.status(201).json({
    status: "success",
    data: {
      client,
    },
  });
});
