<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Title of the Document</title>
  </head>
  <body>
    <input type="text" placeholder="Type " id="inputId" class="inputClass">
    <button type="button" onclick="getInputValue();">Get Value</button>
    <script>
      function getInputValue() {
        // Selecting the input element and get its value 
        let inputVal = document.getElementsByClassName("inputClass")[0].value;
        // Displaying the value
        alert(inputVal);
      }
    </script>
  </body>
</html>