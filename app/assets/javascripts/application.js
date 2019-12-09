// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery/dist/jquery.js
//= require_tree .


// 投稿ボタン
var animateButton = function(e) {

  e.preventDefault;
  //reset animation
  e.target.classList.remove('animate');
  
  e.target.classList.add('animate');
  setTimeout(function(){
    e.target.classList.remove('animate');
  },700);
};

var bubblyButtons = document.getElementsByClassName("bubbly-button");

for (var i = 0; i < bubblyButtons.length; i++) {
  bubblyButtons[i].addEventListener('click', animateButton, false);
}







$('.menu').on('click',function(){
  $(this).toggleClass('on');
  if($('.fullnav').hasClass('on')){//fullnavが開いている時
      $('.fullnav').removeClass('on').fadeOut();
  }
  else{//fullnavが閉じている時
      $('.fullnav').fadeIn();
      setTimeout(function() {
          $(".fullnav").addClass("on");
      }, 200);
  }
});


$(document).ready(function(){
  $("#topBtn").hide();
  $(window).on("scroll", function() {
      if ($(this).scrollTop() > 100) {
          $("#topBtn").fadeIn("fast");
      } else {
          $("#topBtn").fadeOut("fast");
      }
      scrollHeight = $(document).height(); //ドキュメントの高さ 
      scrollPosition = $(window).height() + $(window).scrollTop(); //現在地 
      footHeight = $("footer").innerHeight(); //footerの高さ（＝止めたい位置）
      if ( scrollHeight - scrollPosition  <= footHeight ) { //ドキュメントの高さと現在地の差がfooterの高さ以下になったら
          $("#topBtn").css({
              "position":"absolute", //pisitionをabsolute（親：wrapperからの絶対値）に変更
              "bottom": footHeight + 20 //下からfooterの高さ + 20px上げた位置に配置
          });
      } else { //それ以外の場合は
          $("#topBtn").css({
              "position":"fixed", //固定表示
              "bottom": "20px" //下から20px上げた位置に
          });
      }
  });
  $('#topBtn').click(function () {
      $('body,html').animate({
      scrollTop: 0
      }, 400);
      return false;
  });
});
















$(document).ready(function() {

  // INITIATE THE FOOTER
siteFooter();
  // COULD BE SIMPLIFIED FOR THIS PEN BUT I WANT TO MAKE IT AS EASY TO PUT INTO YOUR SITE AS POSSIBLE
  $(window).resize(function() {
      siteFooter();
  });

  function siteFooter() {
      var siteContent = $('#site-content');
      var siteContentHeight = siteContent.height();
      var siteContentWidth = siteContent.width();

      var siteFooter = $('#site-footer');
      var siteFooterHeight = siteFooter.height();
      var siteFooterWidth = siteFooter.width();

      console.log('Content Height = ' + siteContentHeight + 'px');
      console.log('Content Width = ' + siteContentWidth + 'px');
      console.log('Footer Height = ' + siteFooterHeight + 'px');
      console.log('Footer Width = ' + siteFooterWidth + 'px');

      siteContent.css({
          "margin-bottom" : siteFooterHeight + 50
      });
  };
});