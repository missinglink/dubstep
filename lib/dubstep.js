
module.exports = function( req, res, next ){

  res.dub = { steps: [] };
  
  res.dub.step = function( step ){

    if( step ){ res.dub.steps.push( step ); }
    else {
      var step = res.dub.steps.shift();
      if( typeof( step ) == 'function' ){
        step( req, res, res.dub.step );
      }
    }

    return res.dub;
  }

  next();
}