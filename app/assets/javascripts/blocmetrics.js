window.blocmetrics = {};

blocmetrics.report = function(eventName){
  // your code here
  //use a POST request to create the event. Assume that jQuery is not present, 
  //use the Ajax functions that are native to web browsers instead
  var request = new XMLHttpRequest();
  request.open("POST", "http://localhost:3000/api/events", true);
  request.setRequestHeader('Content-Type', 'application/json');

  request.onreadystatechange = function() {
    // #2
  };

  request.send(JSON.stringify({"event_name":eventName}));
};

