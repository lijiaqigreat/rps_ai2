<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.Blob" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.datastore.EntityNotFoundException" %>

<%@ page import="java.util.Date" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Rock Paper Scisser Game - with AI</title>
    <link rel="icon" href="asset/logo_16x16.jpg">
    <!-- Bootstrap-->
    <!--<link rel='stylesheet', href='http://bootswatch.com/cosmo/bootstrap.min.css'>-->
    <!-- link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootswatch/3.2.0/darkly/bootstrap.min.css" -->
    <link rel="stylesheet" href="css/main.css">
  </head>
  <body>
    <div class="container">
      <div role="navigation" class="navbar navbar-default">
        <div class="navbar-header">
          <button type="button" data-toggle="collapse" data-target=".navbar-collapse" class="navbar-toggle">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a href="#" class="navbar-brand">
            Rock Paper Scisser AI
          </a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="#">HOME</a></li>
            <li class="dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle">DOCS<span class="caret"></span></a>
              <ul role="menu" class="dropdown-menu">
                <li><a href="https://github.com/lijiaqigreat/rps_ai/blob/gh-pages/doc/requirement.md">Requirement</a></li>
              </ul>
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="https://github.com/lijiaqigreat/rps_ai">View on Github</a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="container" id="main">
      <div id="game" >
        <div id="g_result" class="row">
          <div class="col-xs-6">
            <div class="panel panel-primary">
              <div class="panel-heading">
                HUMAN
              </div>
              <div class="panel-body">
                <img class="gr" src="asset/rps_r0.jpg" id="gr_0"/>
              </div>
            </div>
          </div>
          <div class="col-xs-6">
            <div class="panel panel-primary">
              <div class="panel-heading">
                ROBOT
              </div>
              <div class="panel-body">
                <img class="gr" src="asset/rps_r1.jpg" id="gr_1"/>
              </div>
            </div>
          </div>
        </div>
        <div id="g_hand" class="row">
          <div class="col-xs-4">
            <div onclick="rps.choose(0)" class="btn btn-success">
              <svg>
                <use xlink:href="asset/rps.svg#svg_r0"></use>
              </svg>
              <div>Rock</div>
            </div>
          </div>
          <div class="col-xs-4">
            <div onclick="rps.choose(1)" class="btn btn-success">
              <svg>
                <use xlink:href="asset/rps.svg#svg_p0"></use>
              </svg>
              <div>Paper</div>
            </div>
          </div>
          <div class="col-xs-4">
            <div onclick="rps.choose(2)" class="btn btn-success">
              <svg>
                <use xlink:href="asset/rps.svg#svg_s0"></use>
              </svg>
              <div>Scisser</div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-7">
            <div class="panel panel-info" id="g_stat">
              <div class="panel-heading">
                Statistics
              </div>
              <div class="panel-body">
                <table class="table" id="gis_table">
                  <thead>
                    <tr>
                      <td>WIN</td>
                      <td>TIE</td> 
                      <td>LOST</td>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>0</td>
                      <td>0</td> 
                      <td>0</td>
                    </tr>
                    <tr>
                      <td>???%</td>
                      <td>???%</td> 
                      <td>???%</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
            <div>
              <div class="btn-group">
                <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">
                  Choose robot <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li class="divider"></li>
                  <li><a href="#">Separated link</a></li>
                </ul>
              </div>
              <a type="button" class="btn btn-danger" href="#">Restart</a>
            </div>
          </div>
          <div class="col-xs-5">
            <div class="panel panel-info" id="g_hist">
              <div class="panel-heading">
                History
              </div>
              <div class="panel-body">
                <div id="gh_scroll">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div id="bot">
        <div id="b_status">
        </div>
        
      </div>
      <div id="intro">
        <p>This is a rock paper scisser game</p>
        <a href="doc/requirement.html">link</a>
      </div>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins)-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- <script>window.jQuery || document.write('<script src="/dist/lib/jquery-2.1.0.min.js"><\/script>')</script> -->
    <!-- Include all compiled plugins (below), or include individual files as needed-->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/react.js"></script>
    <script src="js/preload.js"></script>
    <%!
private static final String BOT_NAME_DEFAULT="markov";
private static final String BOT_TYPE_DEFAULT="default";
private static final String BOT_KIND="Bot";

private static Entity defaultBot=null;
private static Entity getDefaultBot(){
  if(defaultBot!=null){
    return defaultBot;
  }
  Key key=KeyFactory.createKey(BOT_KIND,BOT_NAME_DEFAULT+"::"+BOT_TYPE_DEFAULT);
  Entity bot=new Entity(key);
  bot.setProperty("name",BOT_NAME_DEFAULT);
  bot.setProperty("type",BOT_TYPE_DEFAULT);
  bot.setProperty("param","{}");
  bot.setProperty("lastUpdate",new Date((long)0));
  byte[] bytes=new byte[0];
  bot.setProperty("data",new Blob(bytes));
  defaultBot=bot;
  System.out.println("test: "+bot);
  return bot;
}
private static Entity getEntity(DatastoreService datastore, String botName, String botType){
  Entity botE=null;
  try{
    Key botKey = KeyFactory.createKey(BOT_KIND, botName+"::"+botType);
    botE = datastore.get(botKey);
  }catch(EntityNotFoundException e){}
  if(botE!=null){
    return botE;
  }
  //try default type
  botType=BOT_TYPE_DEFAULT;
  try{
    Key botKey = KeyFactory.createKey(BOT_KIND, botName+"::"+botType);
    botE = datastore.get(botKey);
  }catch(EntityNotFoundException e){}
  if(botE!=null){
    return botE;
  }
  return getDefaultBot();
}

    %>
    <%
  DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
  Entity botE;
  //init botE;
  {
    // parse request
    String botName = request.getParameter("botname");
    String botType = request.getParameter("bottype");
    //setup botname
    if (botName== null) {
      botName = BOT_NAME_DEFAULT;
    }
    pageContext.setAttribute("botname", botName);

    if(botType==null){
      botType = BOT_TYPE_DEFAULT;
    }
    botE = getEntity(datastore,botName,botType);
  }
  //setup bot in client
  pageContext.setAttribute("botname",botE.getProperty("name"));
  pageContext.setAttribute("botdata",botE.getProperty("data"));
    %>
    <div class="wasteland" id="server">
      <div id="s_last">
        <%= botE.getProperty("lastUpdate").getLong() %>
      </div>
      <div id="s_param">
        <%= botE.getProperty("param") %>
      </div>
      <embed id="s_data" type="application:octet-stream" src="botdata?key=${botdata}" onload="rps.init_bot();">
      </embed>
    </div>
    </embed>
    <script src="js/bots/${botname}.js">
    </script>
    <script src="js/bots/markov.js"></script>
    <script src="js/postload.js"></script>
    <!--script src="vendor/jquery.min.js"></script-->
  </body>
</html>
