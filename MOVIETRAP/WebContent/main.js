//send data for each movie(thumbnail);
 	 function moviepage(img){
	var id = img.getAttribute('alt'); 		
		var url = "MOVIETRAPServlet?command=moviepage&movieid="+id;
		console.log(id)
		location.href = url;	  
	  
	}
// qna send msg
function qna_send() {
	var theForm = document.frm;
	theForm.action =  "MOVIETRAPServlet?command=qna_send"; 
	theForm.submit();
}
//pic slide 
	let buttonRight = document.getElementById('slideRight');
	let buttonLeft = document.getElementById('slideLeft');

	buttonLeft.addEventListener('click', function(){
		document.getElementById('trend_movie').scrollLeft -= 500
	})

	buttonRight.addEventListener('click', function(){
		document.getElementById('trend_movie').scrollLeft += 500
})
