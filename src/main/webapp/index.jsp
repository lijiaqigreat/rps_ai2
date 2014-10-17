<!doctype html>
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
        <div id="g_info" class="row">
          <div class="col-xs-7">
            <div class="panel panel-info" id="gi_stat">
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
            <div class="rh3">
              Message
            </div>
            <p>
              You have won 10 games in a row!
            </p>
            </div>
          </div>
          <div class="col-xs-5">
            <div class="panel panel-info" id="gi_hist">
              <div class="panel-heading">
                History
              </div>
              <div class="panel-body">
                <div id="gih_scroll">
                </div>
              </div>
            </div>
          </div>
        </div>
        <div id="g_hand">
          <div class="btn-group btn-group-justified">
            <div onclick="rps.choose(0)" class="btn btn-default btn-xs">
              <img src="asset/rps_r0.jpg"/>
              <div>Rock</div>
            </div>
            <div onclick="rps.choose(1)" class="btn btn-default btn-xs">
              <img src="asset/rps_p0.jpg"/>
              <div>Paper</div>
            </div>
            <div onclick="rps.choose(2)" class="btn btn-default btn-xs">
              <img src="asset/rps_s0.jpg"/>
              <div>Scisser</div>
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
    <script>
      server={};
    </script>
    <script src="js/bots/random.js"></script>
    <script src="js/postload.js"></script>
    <!--script src="vendor/jquery.min.js"></script-->
  </body>
</html>
