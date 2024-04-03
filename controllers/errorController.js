const globalErrorHandler = (err, _, res, __) => {
  res.status(err.statusCode).json(err);
};

module.exports = globalErrorHandler;
