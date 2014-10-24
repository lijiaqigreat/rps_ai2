var rps=$.extend((rps||{}),function(){
  return {
    //data
    consts:
    {
      randomInt:randomInt,
      abbr:["r","p","s"],
      result:["TIE","LOSE","WIN"]
    },
    server:
    {
      lastUpdate:$("#s_last").text(),
      param:JSON.parse($("#s_param").text()),
      data:null,
      games:null
    },

    //-- bot --
    bot:undefined,
    history:
    {
      turn:[],
      time:[]
    },

    //--- ui ---
    //update view
    updateView:function()
    {
      var h01=this.history[this.history.length-1] | 0;
      var h0=h01%3;
      var h1=(h01/3)|0;
      //update result
      $("#gr_0").attr("src","asset/rps_"+this.consts.abbr[h0]+"0.jpg");
      $("#gr_1").attr("src","asset/rps_"+this.consts.abbr[h1]+"1.jpg");
      
      //update history
      React.renderComponent(new roundsR({list:this.history}),$("#gh_scroll")[0]);
      //update stat
      //TODO
      var count=[0,0,0];
      this.history.forEach(function(h01){
        var h0=h01%3;
        var h1=(h01/3)|0;
        count[(h1-h0+3)%3]++;
      });
      var sum=count[0]+count[1]+count[2];
      var getPersent=function(i){
        if(sum===0){
          return "???%";
        }else{
          return ((100*count[i]/sum+0.5)|0)+"%";
        }
      };
      var trs=$("#gis_table tbody").children();
      $(trs[0]).children().each(function(i){
        i=(i+2)%3;
        this.innerHTML=count[i]>99?"99+":count[i];
      });
      $(trs[1]).children().each(function(i){
        i=(i+2)%3;
        this.innerHTML=getPersent(i);
      });
    },
    choose:function(h0)
    {
      //update model
      var h1=this.bot.getHand();
      this.bot.update(h0,h1);
      this.history.push(h0+h1*3);
      this.updateView();
    },
    end:function()
    {
      //TODO
      //submit game
      //refresh
    },

  };
}());
//server: update rps.bot, rps.
