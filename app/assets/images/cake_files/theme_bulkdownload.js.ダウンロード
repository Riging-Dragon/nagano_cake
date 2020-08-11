/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
     $('.folder-icon').click(function(event)
     {
        $('.folder-counter').slideToggle('normal', function() {
        	var toggle_view_flg = $('.folder-counter').is(':hidden');
        	if ( toggle_view_flg == true ) {
        		sessionStorage.setItem('folder-counter-toggle', '0');
        	} else {
        		sessionStorage.setItem('folder-counter-toggle', '1');
        		$('.folder-counter-box').mCustomScrollbar("update");
        	}
        });
     });
     $(document).on('click','.img-remove',function(){
       var imgid=$(this).attr('attrid');
       var imgtype=$(this).attr('attrtype');
       var currentelem =$(this);
       currentelem.parents(".col-item").remove();
       currentelem.parent().remove();
        $.ajax({
            url:'/image/remove_select/',
            type: 'GET',
            dataType: 'json',
            async: true,
            data: {image_id: imgid,image_type:imgtype},
            success: function (response) {
                //alert(response);
                $('.img-count').html(response.count);
            }
        });
        if($("#append_image .col-item").length ==0) $('#bulkDownloadModal .span-no-download-items').show();
    });
});
function download_select(element, image_id, title, size, filename) {
    $.ajax( {
              url:'/image/download_select/'+image_id+'/'+size + '/' + filename,
                type: 'POST',
                dataType: 'json',
                async: true,

                success: function(response) {
                    if(response.status == 'error') alert(response.message);
                    $('.img-count').html(response.count);
                    if(response.data){
                        var image_id=response.data.id;
                        var image_name=response.data.image;
                        var image_size=response.data.size;

                        var cart = $('.btn-bulkdownload');
                        var imgtodrag = $(element).parents('.quickViewBox').find("img.image-thumbnail").eq(0);
                        if (imgtodrag.length > 0) {
                            var imgclone = imgtodrag.clone().offset({
                                top: imgtodrag.offset().top,
                                left: imgtodrag.offset().left
                            }).css({
                                'opacity': '0.8',
                                'position': 'absolute',
                                'height': imgtodrag.height() - 25,
                                'width': imgtodrag.width() - 25,
                                'z-index': '10009'
                            }).appendTo($('body')).animate({
                                'top': cart.offset().top + 10,
                                'left': cart.offset().left + 10,
                                'width': 25,
                                'height': 25
                            }, 1000, 'easeInOutExpo');

                            setTimeout(function () {
                                $('.img-count').effect('shake', {distance: "5"});
                            }, 1500);

                            imgclone.animate({
                                'width': 0,
                                'height': 0
                            }, function () {
                                $(this).detach()
                            });
                        }else{
                            $('.img-count').effect('shake', {distance: "5"});
                        }
                        
                        $('.folder-counter').show();

                        //var html="<div class="+"'folder-img-div "+image_size+"'"+" id="+"'"+image_id+"'"+"><img src="+"'"+image_name+"'"+"/>";
            			// html+='<span class="img-remove" attrid="' + image_id + '" attrtype="' + size + '"></span>';
            			// html+="</div>";

                        var html = `<div class="col-item col-6 mb-3">
                                <div class="inner">
                                    <div class="imgbox `+image_size+`">
                                        <img src="`+image_name+`">
                                    </div>
                                    <div class="img-hover-actions">
                                        <span class="img-remove" attrid="`+image_id+`" attrtype="`+size+`"></span>
                                    </div>
                                </div>
                            </div>`;
                        $('#bulkDownloadModal .span-no-download-items').hide();

                        $('#append_image').prepend(html);
                        $('#thumb-modal-close').trigger('click');
                   }

                },
                error: function() {
                }
            });
    }

    function clear_cart(){
	$('.img-count').html(0);
	$(".folder-counter-box").html('');
    $('#bulkDownloadModal .span-no-download-items').show();
    }

    function clear_cart_image(){
        $('.img-count').html(0);
        $("#append_image").html('');
        $('#bulkDownloadModal .span-no-download-items').show();
    }
