<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Hello OpenCV.js</title>
</head>
<body>
   <!-- 흑백 처리 후 그려질 공간 -->
   <canvas id=canvasOutput width=320 height=240></canvas>
   <!-- 카메라 프레임이 그려질 공간 -->
   <video id="videoInput" width=320 height=240></video>
   <script type="text/javascript">

/* 카메라 허용하기 & 스트리밍 시작 */
let video = document.getElementById("videoInput");
navigator.mediaDevices.getUserMedia({ video: true, audio: false })
    .then(function(stream) {
        video.srcObject = stream;
        video.play();
    })
    .catch(function(err) {
        console.log("An error occurred! " + err);
    });
    
let canvasOutput = document.getElementById('canvasOutput');

/* OpencvJS 로딩 완료시 콜백함수 */
function onOpenCvReady(){
   let height = video.height;
   let width = video.width;
   let src = new cv.Mat(height, width, cv.CV_8UC4); // 8 byte 4 channel
   let dst = new cv.Mat(height, width, cv.CV_8UC1); // 8 byte 1 channel
   let cap = new cv.VideoCapture(video);
   const FPS = 30; // 초당 프레임수 조절 -> 흑백 변환 프레임 레이트
   function processVideo() {
       let begin = Date.now();
       cap.read(src);
       console.log(src.data);
       sendData(src.data); // 서버로 데이터 전송
       cv.cvtColor(src, dst, cv.COLOR_RGBA2GRAY);
       cv.cvtColor(src, dst, cv.COLOR_RGB2BGR);
       cv.imshow("canvasOutput", dst);
       // schedule next one.
       let delay = 1000/FPS - (Date.now() - begin);
       setTimeout(processVideo, delay);
   }
   // schedule first one.
   setTimeout(processVideo, 0);
}

let requestURL = "http://localhost:5002/sendFrame";
function sendData(data){
   const xhr = new XMLHttpRequest();
    xhr.open('POST', requestURL);
    xhr.onload = () => {
      console.log(xhr.response); // 응답 메세지

    };
    xhr.send(data);
}
</script>
   <!-- OpencvJS 라이브러리 가져오기 -->
   <script async src="https://docs.opencv.org/3.4.0/opencv.js"
      onload="onOpenCvReady()" type="text/javascript"></script>
</body>
</html>