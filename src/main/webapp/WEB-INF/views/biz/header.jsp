<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div>
        <input type="text" id="messageinput">
    </div>
    <div>
        <button onclick="openSocket();">Open</button>
        <button onclick="send();">Send</button>
        <button onclick="closeSocket();">close</button>
    </div>
    <div id="message"></div>
    <script>
        var ws;
        var messages = document.getElementById("message");
        
        function openSocket(){
            if(ws!==undefined && ws.readyState!==WebSocket.CLOSED)
            {
                writeResponse("WebSocket is already opend.");
                return;
            } 
            
            //웹소켓 객체 만드는 코드
            ws = new WebSocket('ws://localhost:8090/jaba/echo');
            
            ws.onopen=function(event){
                if(event.data===undefined) return;
                writeResponse(event.data);
            };
            ws.onmessage=function(event){
                writeResponse(event.data);
            };
            ws.onclose=function(event){
                writeResponse("Connection closed");
            }
        }
        function send(){
            var text = document.getElementById("messageinput").value;
            ws.send(text);
            text="";
        }
        function closeSocket(){
            ws.close();
        }
        function writeResponse(text){
            message.innerHTML+="<br/>"+text;
        }
    </script>
</body>
</html>