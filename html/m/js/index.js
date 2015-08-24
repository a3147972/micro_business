$(function(){
    $('.search form input[type=text]').focus(function() {
        $(this).css({
            background:'none'
        })
        $(this).attr('placeholder', '');
    }).blur(function(){
        $(this).css({
          "background" : "url('img/search_icon.png') no-repeat 3px;",
          "background-size": "20px 20px"
        })
        $(this).attr('placeholder', '       授权查询');
    })
})
