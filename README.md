Dub Step
--------

A kind of response middleware for expressjs.
Lets you seperate and re-use view specific logic from your controllers.

Example step recipes coming soon.

A basic step used to set HTML title
-----------------------------------

```javascript
  var title = function( title, function(req, res, step){
    res.title = 'Company -- ' + title;
    step();
  });
```

A view renderer
-----------------------

```javascript
  var html = function(req, res, step){
    res.send( '<html><title>'+res.title+'</title><body><h1>'+res.title+'</h1></html>' );
  };
```

Define the steps in your express controller
-------------------------------------------

```javascript
app.get('/home', function(req, res){
  res.dub.step( title( 'Home Page' ) )
         .step( html )
         .step();
});
```

Run Tests
---------

```bash
npm test
```

License
------------------------

Released under the MIT(Poetic) Software license

    This work 'as-is' we provide.
    No warranty express or implied.
    Therefore, no claim on us will abide.
    Liability for damages denied.

    Permission is granted hereby,
    to copy, share, and modify.
    Use as is fit,
    free or for profit.
    These rights, on this notice, rely. 
