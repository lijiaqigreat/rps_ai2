rps.bot=function(param, data){
  var react=React.createClass({
    render:function(){
      return React.DOM.div({},this.props.text);
    }
  });
  return {
    //should not update bot state, can use random
    getHand:function(){
      return rps.randomInt(3);
    },
    //change bot state, should not use random
    update:function(h_hum,h_bot){
    },
    //update data, using raw game
    train:function(games){
      games.forEach(function(game,i){
        //update game
      });
    },
    //notify human the state
    getReact: function(){
      return new react(this._private);
    },
    //anything else
    _private:{
      text:"template"
    }
  };
}(server.param,server.data);
