var x = 0;
var y = 0;
var isDrawing = false;

var cnv = document.getElementById("dinoCanvas");
var ctx = cnv.getContext("2d");

var img = new Image();


img.src = 'Images/Accessories/dino.png';


img.onload = function () {
    ctx.drawImage(img, 0, 0, 500, 300); //last 2 args define img dimensions
}

cnv.addEventListener("mousedown", startDrawing);
cnv.addEventListener("mousemove", draw);
cnv.addEventListener("mouseup", stopDrawing);

cnv.addEventListener("touchstart", startDrawing);
cnv.addEventListener("touchmove", draw);
cnv.addEventListener("touchend", stopDrawing);

let color = 'yellow';

function startDrawing(e) {
    e.preventDefault();
    console.log("Drawing started");
    x = (e.type.startsWith('touch') ? e.touches[0].clientX : e.offsetX) / 2;
    y = (e.type.startsWith('touch') ? e.touches[0].clientY : e.offsetY) / 2;
    isDrawing = true;
}

function draw(e) {
    e.preventDefault();
    if (isDrawing === true) {
        const currentX = (e.type.startsWith('touch') ? e.touches[0].clientX : e.offsetX) / 2;
        const currentY = (e.type.startsWith('touch') ? e.touches[0].clientY : e.offsetY) / 2;
        drawLine(x, y, currentX, currentY);
        x = currentX;
        y = currentY;
    }
}

function stopDrawing(e) {
    e.preventDefault();
    console.log("Drawing stopped");
    if (isDrawing === true) {
        const endX = (e.type.startsWith('touch') ? e.changedTouches[0].clientX : e.offsetX) / 2;
        const endY = (e.type.startsWith('touch') ? e.changedTouches[0].clientY : e.offsetY) / 2;
        drawLine(x, y, endX, endY);
        x = 0;
        y = 0;
        isDrawing = false;
    }
}

function drawLine(x1, y1, x2, y2) {
    ctx.beginPath();
    ctx.strokeStyle = color;
    ctx.lineWidth = 10;
    ctx.moveTo(x1, y1);
    ctx.lineTo(x2, y2);
    ctx.stroke();
    ctx.closePath();
}

const selectedColor = document.querySelectorAll('.color-selection');
console.log('colorselects', selectedColor);





///////////////////////////////////////////////
//dragondrop



let draggedElement = null;

const dragContainer = document.getElementById('dragContainer');
const dragImgs = document.querySelectorAll('.accessory-img');



const handleDragStart = function (e) {
    e.dataTransfer.setData('text/plain', e.target.id);
    draggedElement = e.target;
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
        const offsetY = (draggedElement.clientHeight * 1.5) - 180;

        const copyOfDraggedElement = draggedElement.cloneNode(true); 
        copyOfDraggedElement.style.position = 'absolute';
        copyOfDraggedElement.style.left = `${mouseX - offsetX}px`;
        copyOfDraggedElement.style.top = `${mouseY - offsetY}px`;

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