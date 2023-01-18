const tg = document.querySelector(".trand_slide_list"); //각각의 슬라이드(li)
const trand_slide_list = document.querySelectorAll('.trand_slide_list > li'); //슬라이드 이미지 전체
const prev = document.querySelector('.prev'); //이전버튼
const next = document.querySelector('.next'); //다음버튼

$.ajax({
  url: "./rankmap.do",
  type: "POST",
  dataType: "json",
  success: function (data) {
    addList(data);
  },
  error: function () {
    alert("error");
  },
});

function addList(data) {	
	for(let i = 0; i < 10; i++) {
		const li = document.createElement('li');
		const img = document.createElement('img');
		const a = document.createElement('a');
		const p = document.createElement('p');
		a.href = './detail.do?area_num='+data[i].area_num+'';
		
		img.setAttribute('src', data[i].area_image);
		
		a.appendChild(img);
		li.appendChild(a);
		p.append(data[i].area_title);
		li.appendChild(p);
		a.appendChild
		
		tg.append(li);
	}
}
    
const startSlide = setInterval(sliderGo, 3000); // 3초마다 함수 sliderGo 함수 발동시키기
let currentIdx = 0; //슬라이드 index 값
  
next.addEventListener('click', function () {
	var highestIntervalId = setInterval(";");
   	for (let i = 0 ; i < highestIntervalId ; i++) {
    	clearInterval(i);
    }//자동이동을 중지한다.
    
    	/*==================================
    	setInterval은 실행 후 숫자 타입의 아이디를 반환하는데 이 값은 함수 호출때마다 증가한다.
    	clearInterval로 자동실행을 중지하고 setInterval로재실행하는 코드만으로 구현시 내부에서 제대로 중지되지 않고
    	자동실행만 중첩되는 현상(버그)발생하여 setInterval이 실행된 후 반환한 숫자 아이디를 모두 초기화하는 구체적인 방법으로
    	구현하였다
    	=============================================================*/
    	
    sliderGo(); //슬라이드를 이동시킨다
    setInterval(sliderGo, 3000);// 자동 슬라이드를 다시 실행시킨다.
});
    
prev.addEventListener('click', function () {
	var highestIntervalId = setInterval(";");
    for (let i = 0 ; i < highestIntervalId ; i++) {
    	clearInterval(i);
    }//자동이동을 중지한다.	
    sliderGo('a'); //sliderGo 함수에서 이벤트발생의 출처가 이전버튼인지 다음버튼인지 구분하기 위해 이전버튼을 눌렀을 때는 임의값을 넘겨주기로한다('1').
    setInterval(sliderGo, 3000);// 자동 슬라이드를 다시 실행시킨다.
});
    
function sliderGo(isPrev) {
	let buttonType;
 
    if(isPrev){
    	buttonType = 'prev';
    }else{
    	buttonType = 'next';
    }
    
    const first = tg.querySelectorAll('.trand_slide_list > li')[0];
    const last = tg.querySelectorAll('.trand_slide_list > li')[9];
    	
   	if(buttonType == 'prev'){//이전 버튼을 눌렀다면 
    	console.log(tg.style.left);
    	tg.style.left = "0px";
        tg.style.transition = "0.6s";
        	  
        setTimeout(function () {  
        	tg.insertBefore(last, tg.firstChild);
          	tg.style.left = "-226px";
          	//transition없애기
          	tg.style.transition = "none";
        }, 600); //0.6초
    		  
	}else if(buttonType == 'next'){//다음 버튼을 눌렀다면
    	tg.style.left = "-452px";
       	tg.style.transition = "0.6s";
    		  
       	setTimeout(function () {
        	tg.appendChild(first);
          	//대상 의 top값이 0으로 이동
          	tg.style.left = "-226px";
          	//transition없애기
          	tg.style.transition = "none";
        }, 600); //0.6초
	};
}