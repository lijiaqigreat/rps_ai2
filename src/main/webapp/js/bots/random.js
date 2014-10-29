/*
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
*/
//TODO robust api
var bot={
  /**
   * this is a static function
   * @param {json} botparam specified by user
   * @return {json} dataParam, used for master to download data
   * TODO add doc for default value
   */
  getDataParam: function(botparam){
    return {};
  },
  train: function(param){
    var botparam=param.botparam;
    var data=param.data;
    var games=param.games;
    return data;
  },
  init: function(param){

  }

  
};
self.onmessage = function(e){
  self.postMessage(bot[e.command](e.param));
};
