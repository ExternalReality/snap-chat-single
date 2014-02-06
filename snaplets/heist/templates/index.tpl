<!doctype html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Introduction to Web Programming with Javascript and Haskell</title>
    <meta name="description" content="Practice! Practice! Practice!">
    <meta name="Us" content="Us">
    <script data-main="js/main" src="js/lib/requirejs/require.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="css/skeleton/base.css">
    <link rel="stylesheet" href="css/skeleton/skeleton.css">
    <link rel="stylesheet" href="css/skeleton/layout.css">

    <link rel="stylesheet" media="screen and (min-width: 801px)" type="text/css" href="css/chat-large.css">
    <link rel="stylesheet" media="screen and (max-width: 800px)" type="text/css" href="css/chat-small.css">

    <link rel="shortcut icon" href="img/favicon.ico">
    <link rel="apple-touch-icon" href="img/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">
  </head>
  <body>

    <ifLoggedIn>
      <div id="container" class="container">
        <div id="menu"></div>
        <div id="content"></div>
      </div>
    </ifLoggedIn>

    <ifLoggedOut>
      <apply template="_login"/>
    </ifLoggedOut>

  </body>
</html>
