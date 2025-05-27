<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Quản lý lô hàng</title>
    <!-- Bootstrap  -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
    />
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
    ></script>

    <!-- jQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- Select2 -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <!-- Font Awesome (cho các icon) -->
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
    />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
            integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />
    <!-- Google Icon -->
    <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0"
    />
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/admin/styleAllInventory.css"/>
    <style>

        #loadingOverlay {
            position: fixed;
            background: rgba(255, 255, 255, 0.3);
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
        }

        .modal-content {
            background-color: var(--White);
            width: 500px;
            max-width: 90%;
            margin: 50px auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .modal-content h3 {
            margin-top: 0;
            color: #fff;
        }

        .modal-content label {
            display: block;
            color: #fff;
            margin: 10px 0 5px;
            font-weight: bold;
        }

        .modal-content input,
        .modal-content textarea,
        .modal-content select {
            background-color: aliceblue !important;
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .modal-content button {
            margin-right: 10px;
        }

    </style>
</head>
<body class="dark-theme">
<jsp:include page="header-admin.jsp"></jsp:include>

<div id="main-content">
    <div class="main-container">
        <div class="header">
            <h1>Danh sách lô hàng</h1>
        </div>
        <div id="all-user-container">
            <a class="btn btn-primary btn-customize px-5 py-2 mb-2"
            <%--  Todo: Thêm lô hàng  --%>
               href="#" role="button" onclick="showBatchesAddForm()">Thêm lô hàng</a>

            <table class="myTable display">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Mã lô</th>
                    <th>Sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Ngày nhập</th>
                    <th>Nhà cung cấp</th>
                    <th>Thời gian tạo</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${batches}" var="batch" varStatus="i">
                    <tr>
                        <td>${batch.batchID}</td>
                        <td>${batch.batchNumber}</td>
                        <td>${batch.productName}</td>
                        <td>${batch.quantity}</td>
                        <td>${batch.importDate}</td>
                        <td>${batch.supplierName != null ? batch.supplierName : 'N/A'}</td>
                        <td>${batch.createdAt}</td>
                        <td>
                            <button
                                    class="btn btn-success btn-sm"
                                    onclick="showBatchesEditForm('${batch.batchID}', '${batch.batchNumber}','${batch.productID}',
                                            '${batch.quantity}', '${batch.importDate}',
                                            '${batch.supplierID}', '${batch.createdAt}')">
                                Chỉnh Sửa
                            </button>

                            <button onclick="confirmDelete()" type="button" class="btn btn-danger btn-sm">
                                <a class="text-white"
                                   href="<%=request.getContextPath()%>/admin/deleteBatch?batchID=${batch.batchID}"> Lưu
                                    trữ</a>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Batches Edit Modal -->
        <div class="modal" id="batchesEditModal">
            <div class="modal-content">
                <h3>Sửa lô hàng</h3>
                <form id="batchesEditForm">
                    <label for="batchesId">Mã lô hàng</label>
                    <input type="text" id="batchesId" name="batchesId" readonly/>

                    <label for="batchesNumber">Số lô hàng</label>
                    <input type="text" id="batchesNumber" name="batchesNumber" readonly/>

                    <label for="productId">Sản phẩm</label>
                    <select id="productId" name="productId">
                        <c:forEach items="${products}" var="product">
                            <option value="${product.productID}">${product.productID} - ${product.productName}</option>
                        </c:forEach>
                    </select>

                    <label for="quantity">Số lượng</label>
                    <input type="text" id="quantity" name="quantity" required/>

                    <label for="importDate">Ngày nhập</label>
                    <input type="text" id="importDate" name="importDate" readonly>

                    <label for="createAt">Ngày tạo</label>
                    <input type="text" id="createAt" name="createAt" readonly/>

                    <label for="supplierID">Nhà cung cấp</label>
                    <select id="supplierID" name="supplierID">
                        <c:forEach items="${suppliers}" var="sup">
                            <option value="${sup.supplierID}">${sup.supplierName}</option>
                        </c:forEach>
                    </select>

                    <button type="submit" class="btn btn-success btn-sm">Lưu</button>
                    <button type="button" class="btn btn-danger btn-sm" onclick="closeModals(this)">
                        Hủy
                    </button>
                </form>
            </div>
        </div>
        <!-- Batches Edit Modal -->


        <!-- Batches Add Modal -->
        <div class="modal" id="batchesAddModal">
            <div class="modal-content">
                <h3>Nhập lô hàng</h3>
                <form id="batchesAddForm">
                    <label for="addBatchesNumber">Số lô hàng</label>
                    <input type="text" id="addBatchesNumber" name="batchesNumber" required/>

                    <label for="addProductId">Sản phẩm</label>
                    <select id="addProductId" name="productId">
                        <c:forEach items="${products}" var="product">
                            <option value="${product.productID}">${product.productID} - ${product.productName}</option>
                        </c:forEach>
                        required
                    </select>

                    <label for="addQuantity">Số lượng</label>
                    <input type="text" id="addQuantity" name="quantity" required/>

                    <label for="addSupplierID">Nhà cung cấp</label>
                    <select id="addSupplierID" name="supplierID">
                        <c:forEach items="${suppliers}" var="sup">
                            <option value="${sup.supplierID}">${sup.supplierName}</option>
                        </c:forEach>
                        required
                    </select>

                    <button type="submit" class="btn btn-success btn-sm">Lưu</button>
                    <button type="button" class="btn btn-danger btn-sm" onclick="closeModals(this)">
                        Hủy
                    </button>
                </form>
            </div>
        </div>
        <!-- Batches Add Modal -->
    </div>
</div>
<!-- Loading Overlay -->
<div id="loadingOverlay" style="display:none;">
    <div class="spinner-border text-white" role="status">
        <span class="visually-hidden">Loading...</span>
    </div>
</div>
<script>
    // Show form 'EDIT' batches
    function showBatchesEditForm(batchesId, batchesNumber, productID, quantity, importDate, supplierID, createAt) {
        document.getElementById("batchesId").value = batchesId;
        document.getElementById("batchesNumber").value = batchesNumber;
        document.getElementById("quantity").value = quantity;
        document.getElementById("importDate").value = importDate;
        document.getElementById("createAt").value = createAt

        // Gán supplierID, productId vào select ==> set selected
        const supplierSelect = document.getElementById("supplierID");
        const productSelect = document.getElementById("productId");
        supplierSelect.value = supplierID; // Chọn option có value trùng với supplierID
        productSelect.value = productID; // Chọn option có value trùng với productId

        // Khởi tạo Select2
        createSelect2();
        // Show form
        document.getElementById("batchesEditModal").style.display = "block";
    }

    // Send request 'EDIT' batches
    document.getElementById('batchesEditForm').addEventListener('submit', async function (e) {
        e.preventDefault();
        let formData = new URLSearchParams(new FormData(this));
        let url = `${pageContext.request.contextPath}/admin/edit-batches`
        // if (!checkIsValidData(formData.get('dishName'), formData.get('dishPrice'))) return;

        try {
            let response = await fetch(url, {
                method: 'Post',
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: formData,
            })

            let result = await response.json();
            if (result.isSuccess) {
                alert('Cập nhật thành công')
                window.location.reload()
            } else {
                alert('Cập nhật thất bại')
                window.location.reload()
            }
        } catch (error) {
        }
    })

    // Show form 'ADD' batches
    function showBatchesAddForm() {
        // Khởi tạo Select2
        createSelect2();
        // Show form
        document.getElementById("batchesAddModal").style.display = "block";
    }

    // Send request 'ADD' batches
    document.getElementById('batchesAddForm').addEventListener('submit', async function (e) {
        e.preventDefault();
        let formData = new URLSearchParams(new FormData(this));
        let url = `${pageContext.request.contextPath}/admin/add-batches`
        // if (!checkIsValidData(formData.get('dishName'), formData.get('dishPrice'))) return;

        try {
            let response = await fetch(url, {
                method: 'Post',
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: formData,
            })

            let result = await response.json();
            if (result.isSuccess) {
                alert('Thêm thành công')
                window.location.reload()
            } else {
                alert('Thêm thất bại')
                window.location.reload()
            }
        } catch (error) {
        }
    })


    // Helper function
    function confirmDelete() {
        return confirm("Bạn có chắc chắn muốn lưu trữ lô hàng này?");
    }

    function closeModals(btnCancel) {
        // document.getElementById("batchesEditModal").style.display = "none";
        let target = btnCancel.form.parentElement.parentElement;
        target.style.display = "none";
    }

    function loading(reload) {
        const loading = document.getElementById("loadingOverlay");
        loading.style.display = "flex";

        if (reload) {
            setTimeout(() => {
                window.location.reload();
            }, 500); // 0.5 giây
        } else {
            setTimeout(() => {
                loading.style.display = "none";
            }, 500); // 0.5 giây
        }
    }

    function createSelect2() {
        // Khởi tạo Select2
        $('#productId').select2({
            allowClear: true,
            width: '100%'
        });
    }

</script>
</body>
</html>
