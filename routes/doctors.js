"use strict";

const express = require('express');
const router  = express.Router();

module.exports = (knex) => {

  router.get("/:id", (req, res) => {
    let doctorId = req.params.id;
    res.render("doctors", { doctorId: doctorId });
  });

  router.get("/login", (req, res) => {
    res.render("login", { doctor: true });
  });

  router.get("/register", (req, res) => {
    res.render("register");
  });

  return router;
}
