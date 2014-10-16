<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Rock Paper Scisser Game - with AI</title>
    <link rel="icon" href="asset/logo_16x16.jpg">
    <!-- Bootstrap-->
    <link rel='stylesheet', href='vendor/bootstrap/css/bootstrap.min.css'>
    <!-- link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootswatch/3.2.0/darkly/bootstrap.min.css" -->
    <link rel="stylesheet" href="css/css.css">
  </head>
  <body>
    <div class="container">
      <div role="navigation" class="navbar navbar-inverse">
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
            <img class="gr" src="asset/rps_r0.jpg" id="gr_0">
          </div>
          <div class="col-xs-6">
            <img class="gr" src="asset/rps_r1.jpg" id="gr_1">
          </div>
        </div>
        <div id="g_stat" class="flexp">
          <div style="width:67%">
            <p class="boxh">Statistics:</p>
            <div class="box" style="background-color:#ff0000">
              <table id="g_score">
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
                    <td>0%</td>
                    <td>0%</td> 
                    <td>0%</td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div>
              Tweet
            </div>
          </div><!--
          --><div style="width:33%">
            <p class="boxh">history:</p>
            <div class="box" style="background-color:#00ff00">
              <div id="g_hist">
              </div>
            </div>
          </div>
        </div>
        <div id="g_hand" class="row">
          <div class="col-xs-4">
            <div class="gh" onclick="rps.choose(0)">
              <img src="asset/rps_r0.jpg">
            </div>
          </div>
          <div class="col-xs-4">
            <div class="gh" onclick="rps.choose(1)">
              <img src="asset/rps_p0.jpg">
            </div>
          </div>
          <div class="col-xs-4">
            <div class="gh" onclick="rps.choose(2)">
              <img src="asset/rps_s0.jpg">
            </div>
          </div>
        </div>
        <div id="g_hist" class="row">
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
