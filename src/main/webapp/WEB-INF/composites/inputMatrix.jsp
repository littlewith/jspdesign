<%@ page pageEncoding="UTF-8" %>
<style>

    button {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        margin: 10px 0;
        border: none;
        cursor: pointer;
        border-radius: 4px;
        font-size: 16px;
    }

    button:hover {
        background-color: #45a049;
    }

    .modal-backdrop {
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.4);
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .modal {
        position: fixed;
        z-index: 2;
        background-color: white;
        padding: 20px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        border-radius: 5px;
        max-width: 80%;
        width: 80%;

        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);

        animation-name: fadeIn;
        animation-duration: 0.8s;
        animation-fill-mode: forwards; /* 让动画结束后保持最终状态 */
    }

    .modal-content {
        margin: 15px;
    }

    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }

    input[type=number] {
        width: 50px;
        padding: 5px;
        margin: 5px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }

    .matrix-header {
        font-weight: bold;
        margin-bottom: 10px;
    }

    .matrix-container{
        display: flex;
        justify-content: center; /* 居中内容 */
        align-items: center; /* 垂直居中 */
        /*height: 100vh; !* 设置容器高度，可以根据需要调整 *!*/
        gap: 10px;
    }

    .matrix-item{
        flex: 1; /* 均分空间 */
        text-align: center; /* 内容水平居中 */
        padding: 10px; /* 可以根据需要调整 */
        border: 3px solid #ccc; /* 可以添加边框样式 */
        border-radius: 10px;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }
</style>

<div id="matrixModalBackdrop" class="modal-backdrop" style="display:none;"></div>

<div id="matrixModal" class="modal" style="display:none;">
    <div class="modal-content">
        <span class="close" onclick="closeMatrixModal()">&times;</span>
        <h2 style="font-weight: lighter;margin-bottom: 10px;">输入矩阵数据</h2>
        <div id="matricesContainer"></div>
        <button type="submit" value="submit">计算矩阵</button>
    </div>
</div>

<script>


    function sendNotice(notice){
        document.getElementById("notice").innerHTML = notice;
    }

    var matrixCount = 0;
    let oldMatrixRowNumber = 0;
    let oldMatrixColNumber = 0;

    function openMatrixModal() {
        document.getElementById("matrixModal").style.display = "block";
        document.getElementById("matrixModalBackdrop").style.display = "flex";
    }

    function closeMatrixModal() {
        document.getElementById("matrixModal").style.display = "none";
        document.getElementById("matrixModalBackdrop").style.display = "none";
    }

    function addMatrixInput(newMatrixCount, rowNumber, colNumber) {
        if(matrixCount>=newMatrixCount){
            return;
        }
         var matricesContainer = document.getElementById("matricesContainer");
        matricesContainer.className = "matrix-container"
        var matrixContainer = document.createElement("div");
        matrixContainer.className = "matrix-item";
        matrixContainer.id = "matrix-item-" + matrixCount;
        var html = '<div class="matrix-header">矩阵' + (matrixCount + 1) + ':</div>';
        html += '<div id="matrixInputs-' + matrixCount + '"></div>';
        matrixContainer.innerHTML = html;
        matricesContainer.appendChild(matrixContainer);
        generateMatrixInputs(matrixCount, rowNumber, colNumber);
        matrixCount++;
        oldMatrixRowNumber = rowNumber;
        oldMatrixColNumber = colNumber;
    }

    function clearMatrixInputArea(){
        matrixCount = 0;
        document.getElementById("matricesContainer").innerHTML = '';
    }

    function checkRowAndCol(rowNumber,colNumber){
        if(rowNumber <=0 || colNumber <=0){
            sendNotice("错误：矩阵的维数必须大于等于0");
            return false;
        }else{
            sendNotice("");
            if(rowNumber !== oldMatrixRowNumber || colNumber !== oldMatrixColNumber){
                clearMatrixInputArea();
            }
            return true;
        }


    }

    function generateMatrixInputs(index, rowNumber, colNumber) {
        var rows = rowNumber;
        var columns = colNumber;
        var matrixInputs = document.getElementById("matrixInputs-" + index);

        matrixInputs.innerHTML = '';

        for (var r = 0; r < rows; r++) {
            for (var c = 0; c < columns; c++) {
                let inputIndex = r*colNumber +c;
                let matrixIndex = index;
                let rowIndex = r +1;
                let colIndex = c +1;
                matrixInputs.innerHTML += '<input type="number" id="matrix-' + index + '-' + r + '-' + c + '" placeholder="'+ rowIndex+'-'+colIndex+'" name="'+ matrixIndex + '-' + inputIndex + '"> ';
            }
            matrixInputs.innerHTML += '<br>';
        }
    }


    document.getElementById("inputDataButton").addEventListener('click',function (event){
        event.preventDefault();
    });
</script>
