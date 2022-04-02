const express = require("express");
const { uniqueNamesGenerator, starWars } = require("unique-names-generator");
const app = express();

const MAX_STAR_WARS_CHARACTERS = process.env.MAX_STAR_WARS_CHARACTERS || 5;

const config = {
  dictionaries: [starWars],
};

const getStarWarsNames = () => {
  const names = [];
  for (let i = 0; i < MAX_STAR_WARS_CHARACTERS; i++) {
    names.push(uniqueNamesGenerator(config));
  }
  return names;
};

app.get("/", (req, res) => {
  res.json(getStarWarsNames());
});

app.listen(3000, () => console.log("app listening on port 3000"));
