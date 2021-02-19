import * as Turbo from "@hotwired/turbo";
Turbo.start();

require("@rails/ujs").start();
require("@rails/activestorage").start();
require("channels");

import "../stylesheets/application.css";

import "controllers";
