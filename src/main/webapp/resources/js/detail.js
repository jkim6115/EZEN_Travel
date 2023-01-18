let prev = document.querySelector('.slide_btn_prev'); //이전버튼
let next = document.querySelector('.slide_btn_next'); //다음버튼

let area_num = document.getElementById('area_num').value; //주소값으로 얻어온 해당 페이지의 area_num

prev.addEventListener('click', function () { //이전 버튼 클릭시
  $.ajax({
    type: 'POST',
    dataType: 'json',
    url: 'mainmap.do',
    success: function (data) {
      //이중반복문을 이용하여 mainmap.do 와 detail.do의 데이터의 교집합을 찾아 일치하는 경우만 페이지 이동을 한다.
      for (let i = 1; i < data.length; i++) {
        for (let j = 0; j < data.length; j++) {
          if (parseInt(area_num) - i == data[j].area_num)
            location.href = './detail.do?area_num=' + data[j].area_num;
        }
      }
    },//data
  });//ajax
}); //prev.click

next.addEventListener('click', function () { //다음 버튼 클릭시
  $.ajax({
    type: 'POST',
    dataType: 'json',
    url: 'mainmap.do',
    success: function (data) {
      //이중반복문을 이용하여 mainmap.do 와 detail.do의 데이터의 교집합을 찾아 일치하는 경우만 페이지 이동을 한다.
      for (let i = 1; i < data.length; i++) {
        for (let j = 0; j < data.length; j++) {
          if (parseInt(area_num) + i == data[j].area_num)
            location.href = './detail.do?area_num=' + data[j].area_num;
        }
      }
    },//data
  });//ajax
}); //next.click

$(document).ready(function () { //상세페이지 area_num에 해당된 데이터만 가져와 append 해준다.
  $.ajax({
    type: 'POST',
    data: { area_num: area_num },
    datatype: 'JSON',
    url: 'detail.do',
    success: function (data) {
      $('#detail_img').append('<img src="' + data.area_image + '"/>');
      $('#detail_src').append(
        '<p><h4>관광지 소개</h4>' + data.area_overview + '</p>'
      );
      $('#detail_web').append(
        '<p><h4>상세주소</h4>' + data.area_address1 + '</p>'
      );
    },
  });
});