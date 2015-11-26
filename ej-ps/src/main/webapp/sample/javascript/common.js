<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

function popupCenterWindow(url, name, popupHeight, popupWidth) {
	var Top = (window.screen.height - popupHeight) / 2;
	var Left = (window.screen.width - popupWidth) / 2;
	if (Top < 0) Top = 0;
	if (Left < 0) Left = 0;
	var newWindow = window.open(url, name, 'height=' + popupHeight + ',width=' + popupWidth + ',scrollbars=no,statusbar=yes,status=yes' + ',top=' + Top + ',left='+Left);  
	newWindow.focus();		
}

<!-- 날짜 선후관계 판단 -->
function fncTermCheck(form) {
	var startDay=0;
	var endDay=0;
	var elementNo;
	for(vi=0; vi<form.elements.length;vi++){
		var formField = form.elements[vi];
		if(formField.getAttribute("startDay") != null && !formField.value == ""){
			startDay = formField.value;
			elementNo=vi;
		}
		if(formField.getAttribute("endDay") != null && !formField.value == ""){
			endDay = formField.value;
		}
	}
	if(startDay != 0 && endDay != 0 && startDay > endDay){
		alert("시작일자는 종료일자 이전이어야 합니다.");
		form.elements[elementNo].focus();
		return false;
	}
	return true;
}

function getCurrentDate(){
 var now = new Date();
 var yyyymmdd;
 yyyymmdd =
  ""+now.getFullYear()
  + ((now.getMonth()+1)<10?("0"+(now.getMonth()+1)):(now.getMonth()+1))
  + (now.getDate()<10?("0"+now.getDate()):now.getDate());
 return yyyymmdd;
}


function toggle(no){

	//var iObject = eval("document.all.sub"+no);
	var iObject = document.getElementById("sub"+no);
	if (iObject.style.display != "none") {
		iObject.style.display = "none" ;

	}
	else {
		for(i=1;i<=10;i++){

			//var obj  = eval("document.all.sub"+i);
			var obj  = document.getElementById("sub"+i);

			if(obj!=null && obj.style.display != "none"){
				obj.style.display = "none" ;
				//eval("document.all.menu"+i+".className='Depth02off'");
				document.getElementById("menu"+i).className='Depth02off';
				break;
			}
		}
		iObject.style.display = "" ;
		//eval("document.all.menu"+no+".className='Depth02on'");
		document.getElementById("menu"+no).className='Depth02on';
	}

}

<!--롤오버 스크립트-->
function overColor(td){
if(document.getElementById||(document.all && !(document.getElementById))){
td.style.backgroundColor="#fdf2e3";
}
}

function outColor(td){
if(document.getElementById||(document.all && !(document.getElementById))){
td.style.backgroundColor="#ffffff";//마우스가 내려왔을때의 색상 설정
}
}


//-->