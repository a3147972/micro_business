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

function AjaxBtn(dom){
    var url = $(dom).attr('href');

    $.ajax({
        url:url,
        type:'get',
        dataType:'json',
        success:function(i){
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

function AjaxUpload(dom){
    var url = $(dom).attr('data-href');
    var thumb = $(dom).attr('data-thumb');
    var thumbElement = $('#'+thumb);
    var input = $(dom).attr('data-input');
    var inputElement = $('#'+input);
    var id = $(dom).attr('id');

    $.ajaxFileUpload({
        url:url,
        secureuri:false,
        fileElementId:id,
        dataType:'json',
        success:function(data,status){
            if (data.status == 1) {
                inputElement.val(data.info);
                thumbElement.attr('src', data.review_info);
            }

            console.log(data);
        }
    })
    return false;
}