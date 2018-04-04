({
  afterRender: function(component) {
    var iframe = component.find('iframe').getElement();
    var action = component.get('c.getUrlForScorecardMini');
    action.setCallback(this, function(a) {
      iframe.src = a.getReturnValue() + '?lightning=true';
    });
    $A.enqueueAction(action);
    var url;

    function navigateIfNeeded() {
      if (url) {
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
          "url": url
        });
        urlEvent.fire();
        //might have to add this timeout back
        setTimeout(function() {
          window.location.reload();
        }, 200);

      }
      setTimeout($A.getCallback(navigateIfNeeded), 200);
    }

    setTimeout($A.getCallback(navigateIfNeeded), 200);

    window.addEventListener("message", receiveMessage, false);

    function receiveMessage(e) {
      var data = e.data;
      if (data.type === 'navigate') {
        url = data.url;
      }
    }
  }
})