$(document).on('turbolinks:load', function(){
    $('.custom-file-input').on('change',function(){
        $(this).next('.custom-file-label').html($(this)[0].files[0].name);
    })
    //ファイルの取消
    $('.reset').click(function(){
        $(this).parent().prev().children('.custom-file-label').html('画像を選択');
        $('.custom-file-input').val('');
    })
});