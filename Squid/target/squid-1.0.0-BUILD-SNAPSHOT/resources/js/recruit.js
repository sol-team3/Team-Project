function recruitCheck(){
 	
	if($('#startDate').val() == "" || $('#startDate').val() == null) {
	       alert('시작 기간을 입력하지 않았습니다.');
	       return false;
    }

 	if($('#endDate').val() == "" || $('#endDate').val() == null) {
	       alert('끝 기간을 입력하지 않았습니다.');
	       return false;
    }

    if($('#restImg').val() != "" ){
        let ext = $('#restImg').val().split('.').pop().toLowerCase();
	  if($.inArray(ext, ['png','jpg','jpeg']) == -1) {
	     alert('등록 할수 없는 파일명입니다.');
	     $("#restImg").focus();
	     $("#restImg").val(""); // input file 파일명을 다시 지워준다.
	     return false;
	  }
    } 
    
  	//용량체크
    if($('#restImg').val() != ""){
        let fileSize = document.getElementById("restImg").files[0].size;
        let maxSize = 1 * 1024 * 1024;//3MB
     	 
        if(fileSize > maxSize){
            alert("첨부파일 사이즈는 3MB 이내로 등록 가능합니다. ");
            $("#restImg").focus();
            $("#restImg").val("");
            return false;
         }
    } 
  	
    if($('#rtConAge').val() == "" || $('#rtConAge').val() == ""){
    	alert('연령을 선택해주세요');
    	$('#rtConAge').focus();
    	return false;
    }
    
	return true;
}

function deleteRecruit(no){
	let ok = confirm("글을 삭제할까요?");
	
	if(ok) {
		location.href="recruit.delete?rt_no=" + no;
	}
}

function updateRecruit(no){
	location.href="recruit.update.go?rt_no=" + no;
}