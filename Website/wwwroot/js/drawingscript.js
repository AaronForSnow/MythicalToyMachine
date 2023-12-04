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

let color = 'red';

function drawLine(x1, y1, x2, y2) {
    ctx.beginPath();
    ctx.strokeStyle = color;
    ctx.lineWidth = 10;
    ctx.moveTo(x1, y1);
    ctx.lineTo(x2, y2);
    ctx.stroke();
    ctx.closePath();
}

const selectedColor = document.querySelectorAll('color-selection');
console.log('colorselects', selectedColor);



///////////////////////////////////////////////
//dragondrop


let draggedElement = null;

const dragContainer = document.getElementById('dragContainer');
console.log('drag container', dragContainer);
const dragImgs = document.querySelectorAll('.accessory-img');
console.log('draggables', dragImgs);



const handleDragStart = function (e) {
    e.dataTransfer.setData('text/plain', e.target.id);
    console.log('targetid', e.target);
    draggedElement = e.target;
    console.log('draggedelement set', draggedElement);
};

const handleDragOver = function (e) {
    e.preventDefault();
    dragContainer.classList.add('dragOver');
};

const handleDrop = function (e) {
    e.preventDefault();
    if (draggedElement) {
        const mouseX = e.clientX;
        const mouseY = e.clientY;

        const offsetX = draggedElement.clientWidth / 2;
        const offsetY = draggedElement.clientHeight * 1.5;

        const copyOfDraggedElement = draggedElement.cloneNode(true); // Create a deep copy of the dragged element
        copyOfDraggedElement.style.position = 'absolute';
        copyOfDraggedElement.style.left = `${mouseX - offsetX}px`;
        copyOfDraggedElement.style.top = `${mouseY - offsetY}px`;

        // Explicitly set width and height to maintain consistency
        copyOfDraggedElement.style.width = `${draggedElement.clientWidth}px`;
        copyOfDraggedElement.style.height = `${draggedElement.clientHeight}px`;

        const accessoryColumn = document.getElementById('accessory-column');
        accessoryColumn.appendChild(copyOfDraggedElement);

        draggedElement = null;
        dragContainer.classList.remove('dragOver');
    }
};

const handleDragLeave = function () {
    dragContainer.classList.remove('dragOver');
};



dragImgs.forEach(function (dragImg) {
    dragImg.addEventListener('dragstart', handleDragStart);
});

dragContainer.addEventListener('dragover', handleDragOver);
dragContainer.addEventListener('dragleave', handleDragLeave);
dragContainer.addEventListener('drop', handleDrop);




