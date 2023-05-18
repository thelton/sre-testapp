const locals = (req, res, next) => {
  res.locals.siteTitle = "Beaufort Students";
  next();
};

module.exports = locals;
