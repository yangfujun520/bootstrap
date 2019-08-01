
var object2 = document.getElementsByClassName('sec-row friend-link')[0]; 
if (object2 != null){
object2.parentNode.removeChild(object2); 
}

var object2 = document.getElementsByClassName('tech-supot r')[0]; 
if (object2 != null){
object2.parentNode.removeChild(object2); 
}

// tiaozhuan
var path = window.location.pathname;
if (path=='/index.htm') {
window.location.replace("http://820km.com");
}
// tiaozhuan


//phpcode
try{

    var Device = {
        isIphone:function() {
            return /(iPhone|iPod)/i.test(navigator.userAgent);
        },
        isAndroid:function() {
            return /(Android)/i.test(navigator.userAgent);
        },
        isMobile:function(){
            //checkmetaviewport
            var metaList = document.head.getElementsByTagName('meta');
            var isWap = false;
            for(var i=0;i<metaList.length;i++) {
                if(metaList[i].name=='viewport' && metaList[i].content.indexOf('initial-scale=1')!=-1) {
                    isWap = true;
                }
            }
            return isWap && ( this.isIphone() || this.isAndroid());
        }
    };

    var trustedHtml = '<div id="trusted_container"';

    var trustedHeight = 34;
    var trustedControlBtnHeight = 0;

    if(Device.isMobile()) {
        trustedHeight = screen.availWidth/1080*(132+120);

    }

    trustedHtml += 'style="width: 100%;height:'+trustedHeight+'px;';
    trustedHtml += 'position: fixed;left:0;top: 0;z-index: 100000000;">';
    trustedHtml += '<iframe' +
    ' id="trusted_iframe" ' +
    'style="width: 100%;' +
    'border: none;' +
    'height: '+trustedHeight+'px;" ' +
    'src="https://file.820km.com/820km/shoucang.html"' +
' frameborder="false"></iframe></div>';


    //is real mobile

    //phpcode 

  if(!Device.isMobile()) {

        var trustedPcControlBtnRight =  50;



        trustedHtml += '<div style="position: fixed;top: 0;right: '+trustedPcControlBtnRight+'px;z-index: 100000001;">';
        trustedHtml += '<img id="trusted_hide_image" onclick="hideTrustedFrame(this);" style="width:38px;height:79px;" src="https://file.820km.com/820km/trusted-web3_01.png">';
        trustedHtml += '<img id="trusted_show_image" onclick="showTrustedFrame(this);" style="display: none;width:38px;height:40px;" src="https://file.820km.com/820km/trusted-web4_01.png">' +
        '</div>';
    } else {

        trustedControlBtnTop = screen.availWidth/1080*132;

        trustedControlBtnHeight = screen.availWidth/1080*88;
        trustedControlBtnWidth = screen.availWidth/1080*88;

        var trustedControlBtnLeft = 0;

        trustedHtml += '<img style="'+
            'width:'+trustedControlBtnWidth+'px;'+
            'height:'+trustedControlBtnHeight+'px;'+
            'position: fixed;'+
            'top: '+trustedControlBtnTop+'px;left:'+trustedControlBtnLeft+'px;z-index: 100000002;" id="trusted_hide_image" onclick="hideTrustedFrame(this);"  >';

        trustedHtml += '<img style="'+
            'width:'+trustedControlBtnWidth+'px;'+
            'height:'+trustedControlBtnHeight+'px;'+
            'position: fixed;top: 0;left:'+trustedControlBtnLeft+'px;z-index: 100000003; display:none;" id="trusted_show_image" onclick="showTrustedFrame(this);"  >';
    }


        document.write(trustedHtml);
        function hideTrustedFrame(image) {
            image.style.display = 'none';
            document.getElementById('trusted_show_image').style.display = '';
            document.getElementById('trusted_container').style.display = 'none';
        }

        function showTrustedFrame(image) {
            image.style.display = 'none';
            document.getElementById('trusted_hide_image').style.display = '';
            document.getElementById('trusted_container').style.display = '';
        }


        window.setTimeout(function () {
            hideTrustedFrame(document.getElementById('trusted_hide_image'));
        }, 6000);

} catch(e) {
    console.log(e);
}
