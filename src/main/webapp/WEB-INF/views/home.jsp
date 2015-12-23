<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="https://www.facebook.com/2008/fbml">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Chat</title>
    <link rel="shortcut icon" href="images/favi.ico"/>
    <meta name="description" content="Chat với người lạ là nơi bạn có thể làm quen với những người bạn mới, chia sẻ những mẩu chuyện, những tâm sự, những ý tưởng hay chỉ đơn giản là giải trí. Sản phẩm của Góc Tâm Hồn" />
    <meta name="keywords" content="chat, trò chuyện, tán gẫu, chém gió, nói chuyện với người lạ, người lạ, bạn bè, tìm bạn mới, kết bạn, goc tam hon" />

    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style type="text/css">
      html {
        height: 100%;
      }
      body {
        height: 100%;
        padding-bottom: 94px;
        padding-top: 143px;
      }
      .logbox {
        overflow: auto;
        overflow-x:hidden;
        list-style-type: none;
        min-height: 100px;
      }

      #header {
        top: 0;
        position: fixed;
        right: 0;
        left: 0;
        z-index: 1030;
        padding-left: 10px;
      }

      #footer {
        bottom: 0;
        margin-bottom: 5px;
        position: fixed;
        right: 0;
        left: 0;
        z-index: 1030;
        padding-left: 10px;
        padding-right: 10px;
      }

      .full-height {
        height: 100%;
      }

      .smiley-chooser {
        display: block;
        height: 200px;
        width: 250px;
        overflow: auto;
      }

      .input-group-addon-fix {
        padding: 0;
      }

      .input-group-addon-fix button {
        height: 100%;
        padding-top: 0;
        padding-bottom: 0;
        margin: 0;
        border: 0;
        border-radius: 0;
      }
      
      .chatbox {
      	box-shadow: 0 1px 2px rgba(41, 128, 185, 1);
      }
      
      .btn_send_message{
      	background-color: #2980B9;
      	color: #FFFFFF;
      }
      
      .btn_new_chat{
      	background-color: #E74C3C;
      	color: #FFFFFF;
      }

    </style>

  </head>
  <body>
    <div class="container-fluid full-height">
      <div class="row" id="header">
        <div class="col-md-8">
          <h1>Chat</h1>

          <ul class="list-inline pull-right">
            <li><a href="http://goo.gl/T3uHdm" target="_blank"><span class="glyphicon glyphicon-thumbs-up"></span> Góp ý</a></li>
            <li><a data-toggle="modal" href="#setting-modal"><span class="glyphicon glyphicon-cog"></span> Cài đặt</a></li>
            <li class="hidden-lg hidden-md" id="online-user-m"></li>
          </ul>
        </div>
        <div class="col-md-4 hidden-sm hidden-xs">
          <h3 id="online-user">Like &amp; Share</h3>
          <div class="media">

            <div class="media-body">
              <h4 class="media-heading"><a href="http://www.facebook.com/chat.goctamhon.org" target="_blank">Chat</a></h4>
              <small>Truy cập fan page để cập nhật thông báo mới nhất</small>
            </div>
          </div>
        </div>

      </div>

      <div class="row full-height" id="content">
        <div class="col-xs-12 full-height">
          <ul id="output" class="chatbox logbox list-group full-height">
            <!-- <li class="progress progress-striped active">
              <div class="progress-bar progress-bar-primary"  role="progressbar" aria-valuenow="100%" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                <span>Đang kết nối...</span>
              </div>
            </li> -->
          <li>Result: ${example}</li>
          </ul>
        </div>
      </div><!--/#content-->

      <div class="row" id="footer">
        <div class="col-xs-12">
          <div style="display: block; padding-top: 10px;">
            <span id="notification" class="pull-left"></span>
            <ul class="list-inline pull-right">
              <li>
                <a id="show-smiley" href="javascript:;" data-toggle="popover" class="hidden" title="Mặt cười">
                  <span class="glyphicon glyphicon-th"></span> Mặt cười
                </a>
              </li>
              <li>
                <a id="like-cs" href="javascript:;" class="hidden">
                  <span class="glyphicon glyphicon-ok-sign"></span> Thích<span class="hidden-xs hidden-sm"> người này</span>
                </a>
              </li>
              <li class="hidden-md hidden-lg">
                <a id="mobile-exit" href="javascript:;" class="hidden">
                  <span class="glyphicon glyphicon-remove-circle"></span> Exit
                </a>
              </li>
            </ul>
          </div>

          <div class="clearfix"></div>
          <div id="menu" class="input-group">
            <span class="input-group-addon input-group-addon-fix hidden-xs hidden-sm">
              <button data-loading-text="Waiting..." id="new" class="btn btn-lg btn_new_chat disabled" type="button">
                  New
              </button>
            </span>

            <textarea style="resize: none;" id="message" rows="2" class="form-control" placeholder="Gõ tin nhắn..." autofocus></textarea>
            <span class="input-group-addon input-group-addon-fix">
              <button id="send" class="btn btn-lg btn_send_message" type="button">
                Send<br /><small class="hidden-xs hidden-sm">Enter</small>
              </button>
            </span>
          </div><!--/ message and options-->
        </div>
      </div><!--/#menu-->
    </div><!--/.container-->


  <div id="fb-root"></div>
  </body>
</html>