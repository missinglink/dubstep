# DubStep

A kind of response middleware for expressjs.

Lets you seperate and re-use view specific logic, keeping it out of your controllers.

Recipes coming soon.

## Example Steps

### A basic step used to set HTML title

```javascript
  var title = function( title, function(req, res, step){
    res.title = 'Company -- ' + title;
    step();
  });
```

### A view renderer

```javascript
  var html = function(req, res, step){
    res.send( '<html><title>'+res.title+'</title><body><h1>'+res.title+'</h1></html>' );
  };
```

## Define the steps in your express controller

```javascript
app.get('/home', function(req, res){
  res.dub.step( title( 'Home Page' ) )
         .step( html )
         .step();
});
```

## Tests

```bash
npm test
```

```bash
dubstep
  ✓ should be a function that is compatible with connect middleware 
  middleware
    ✓ should define a function dub.step() 
    ✓ should call next() once 
  steps
    ✓ should behave like a queue (first in first out) 
    ✓ should stop when a step neglects to call the next step() 
    ✓ should have access to req and res from connect 

6 tests complete (3 ms)
```

## License

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
