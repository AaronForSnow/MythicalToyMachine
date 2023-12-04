    var x = 0;
    var y = 0;
var isDrawing = false;
    
    var cnv = document.getElementById("dinoCanvas");
var ctx = cnv.getContext("2d");

var img = new Image();

// Set the source of the image
img.src = 'Images/Accessories/dino.png';

// When the image is loaded, draw it on the canvas
img.onload = function () {
    // Draw the image at position (0, 0) on the canvas
    ctx.drawImage(img, 0, 0, 500, 300); //last 2 args define img dimensions
}


    cnv.addEventListener("mousedown", (e) => {
        console.log("mouse has been clicked");
        x = e.offsetX;
        y = e.offsetY;
        isDrawing = true
    });

    cnv.addEventListener("mousemove", (e) => {
        if (isDrawing === true) {
            drawLine(x/2, y/2, e.offsetX/2, e.offsetY/2);
            x = e.offsetX ;
            y = e.offsetY ;
        }
    });

    cnv.addEventListener("mouseup", (e) => {
        console.log("mouse has been unclicked");
        if (isDrawing === true) {

            drawLine(x, y, e.offsetX, e.offsetY);
            x = 0;
            y = 0;
            isDrawing = false;
        }
    });

    function drawLine(x1, y1, x2, y2) {
        ctx.beginPath();
        ctx.strokeStyle = "red";
        ctx.lineWidth = 10;
        ctx.moveTo(x1, y1);
        ctx.lineTo(x2, y2);
        ctx.stroke();
        ctx.closePath();
    }

