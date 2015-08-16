function AjaxForm(dom){
    var url = $(dom).attr('action');
    var data = $(dom).serialize();

    $.ajax({
        url:url,
        data:data,
        type:'post',
        dataType : 'json',
        success : function(i){
            if (i.status == 1) {
                window.location.href = i.url;
            } else {
                var d = dialog({
                    title: '发生错误了',
                    content: i.info,
                    okValue : '确定',
                    ok : function (){}
                });
                d.showModal();
            }
        }
    })

    return false;
}