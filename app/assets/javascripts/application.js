// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap
//= require bootstrap-tour

var tour = new Tour({
  steps: [
  {
    element: "#starthere",
    title: "This is Clair's title",
    content: "This is Clair's first bit of content"
  },
  {
    element: "#second bit",
    title: "Title of my second step",
    content: "Content of my second step"
  }
]});

// Initialize the tour
tour.init();

// Start the tour
tour.start();