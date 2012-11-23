<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
    .preview { width: 70px; height: 70px; text-align: center; border:1px solid silver; }
</style>

<input type="file" id="fileData" name="fileData" accept="image/jpg" onchange="fileUpPreview(this, document.getElementById('nf_preview'));" />
<div id="preview" class="preview" title="이미지 미리보기"></div>

<script type="text/javascript">//<![CDATA[
/* 파일 업로드 전 이미지 미리보기
07. 03. 2008 Yeon Jun Kwak
*/
function fileUpPreview(objFile, previewer) {
    if(!/(\.gif|\.jpg|\.jpeg|\.png)$/i.test(objFile.value)) { alert("이미지 형식의 파일을 선택하십시오"); return; }

    // 브라우저 구분
    if (window.navigator.userAgent.indexOf("MSIE 7") != -1) {    // ie 7 이면
        previewer.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='file://" + String(objFile.value) +"', sizingMethod='scale')";
    /* 제어판 > 인터넷 옵션 > 보안 > 사용자 지정 수준 > 기타 > 파일을 서버에 업로드할 때 로컬 디렉터리 경로 포함 : 사용
     설정한 경우에는 아래의 else if 부분을 위의 ie 7 조건부에 OR 조건으로 포함시켜주기만 하면 된다. */
    } else if(window.navigator.userAgent.indexOf("MSIE 8") != -1) { // IE 8 이면
        // objFile.Value 값이 'C:\fakepath\파일경로' 이므로 클립보드를 이용한 편법을 쓴다.
        // 클립보드 엑세스 허용여부를 계속 물어보는데, 귀찮지 않게 쓰려면
        // 제어판 > 인터넷 옵션 > 보안 > 사용자 지정 수준 > 스크립팅 > 프로그램 클립보드 액세스 허용 : 사용
        objFile.activate();
        document.execCommand('Copy');  
        previewer.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='file://" + String(window.clipboardData.getData('Text')) +"', sizingMethod='scale')";
    } else {    // ie 7 이 아닌 브라우저이면
        previewer.innerHTML = "";
        var W = previewer.offsetWidth;
        var H = previewer.offsetHeight;
        //var tmpImage = new Image();
        var tmpImage = document.createElement( 'img' );
        previewer.appendChild(tmpImage);

        tmpImage.onerror = function () {
            //alert("이미지 미리보기 생성중 오류발생.");   // 오류발생을 알리고싶으면 이 줄 맨 앞의 주석 해제
            return previewer.innerHTML = "";
        }

        tmpImage.onload = function () {
            if (this.width > W) {
                this.height = this.height / (this.width / W);
                this.width = W;
            }
            if (this.height > H) {
                this.width = this.width / (this.height / H);
                this.height = H;
            }
        }

        if (window.navigator.userAgent.indexOf("Firefox/3") != -1) {    // firefox3 이면
            var picData = objFile.files.item(0).getAsDataURL();
            tmpImage.src = 'data:' + picData;
            tmpImage.writeAttribute("title", "ImageSize: "+ objFile.files.item(0).fileSize +" byte");
        } else {
            tmpImage.src = "file://" + objFile.value;
        }
    }
}
//]]></script>



