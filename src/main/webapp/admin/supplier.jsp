<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Quản lý nhà cung cấp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"/>
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

        #archive-supplier {
            display: none;
        }

    </style>
</head>
<body class="dark-theme">
<jsp:include page="header-admin.jsp"></jsp:include>

<div id="main-content">
    <div class="main-container">
        <div class="header">
            <h1>Danh sách nhà cung cấp</h1>
        </div>
        <div id="all-user-container">
            <a class="btn btn-primary btn-customize py-2 mb-2"
               href="#" role="button" onclick="showSupplierAddForm()">Thêm nhà cung cấp</a>

            <%--  Todo: Danh sách các lô hàng đã lưu trữ --%>
            <a class="btn btn-primary btn-customize py-2 mb-2"
               href="#" role="button" onclick="openTableArchive()">Các nhà cung cấp đãlưu trữ</a>

            <table class="myTable display">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên nhà cung cấp</th>
                    <th>Thông tin liên hệ</th>
                    <th>Địa chỉ</th>
                    <th>Thời gian tạo</th>
                    <th>Thời gian cập nhật</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${suppliers}" var="supplier">
                    <tr>
                        <td>${supplier.supplierID}</td>
                        <td>${supplier.supplierName}</td>
                        <td>${supplier.contactInfo != null ? supplier.contactInfo : 'N/A'}</td>
                        <td>${supplier.address != null ? supplier.address : 'N/A'}</td>
                        <td>${supplier.createdAt}</td>
                        <td>${supplier.updatedAt}</td>
                        <td>
                            <a class="btn btn-success btn-sm"
                               href="#"
                               onclick="showSupplierEditForm('${supplier.supplierID}','${supplier.supplierName}',
                                       '${supplier.contactInfo }', '${supplier.address}', '${supplier.createdAt}',
                                       '${supplier.updatedAt}')">Sửa</a>
                            <a class="btn btn-danger btn-sm"
                               href="<%=request.getContextPath()%>/admin/soft-delete?supplierID=${supplier.supplierID}"
                               onclick="return confirmDelete();">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Supplier Add Modal -->
        <div class="modal" id="supplierAddModal">
            <div class="modal-content">
                <h3>Thêm nhà cung cấp</h3>
                <form id="supplierAddForm">

                    <label for="addSupplierName">Tên nhà cung cấp</label>
                    <input type="text" id="addSupplierName" name="addSupplierName" required/>

                    <label for="addSupplierInfo">Thông tin nhà cung cấp</label>
                    <input type="text" id="addSupplierInfo" name="addSupplierInfo" required/>

                    <label for="addSupplierAddress">Địa chỉ nhà cung cấp</label>
                    <input type="text" id="addSupplierAddress" name="addSupplierAddress" required/>


                    <button type="submit" class="btn btn-success btn-sm">Lưu</button>
                    <button type="button" class="btn btn-danger btn-sm" onclick="closeModals(this)">
                        Hủy
                    </button>

                </form>
            </div>
        </div>
        <!-- Supplier Add Modal -->

        <!-- Supplier Edit Modal -->
        <div class="modal" id="supplierEditModal">
            <div class="modal-content">
                <h3>Sửa nhà cung cấp</h3>
                <form id="supplierEditForm">
                    <label for="supplierId">Mã nhà cung cấp</label>
                    <input type="text" id="supplierId" name="supplierId" readonly/>

                    <label for="supplierName">Tên nhà cung cấp</label>
                    <input type="text" id="supplierName" name="supplierName" required/>

                    <label for="supplierInfo">Thông tin liên hệ</label>
                    <input type="text" id="supplierInfo" name="supplierInfo" required/>

                    <label for="supplierAddress">Địa chỉ nhà cung cấp</label>
                    <input type="text" id="supplierAddress" name="supplierAddress" required/>

                    <label for="createAt">Ngày tạo</label>
                    <input type="text" id="createAt" name="createAt" readonly/>

                    <label for="updatedAt">Cập nhật lúc</label>
                    <input type="text" id="updatedAt" name="updatedAt" readonly>

                    <button type="submit" class="btn btn-success btn-sm">Lưu</button>
                    <button type="button" class="btn btn-danger btn-sm" onclick="closeModals(this)">
                        Hủy
                    </button>
                </form>
            </div>
        </div>
        <!-- Supplier Edit Modal -->

        <!-- Archive Supplier -->
        <div id="archive-supplier">
            <div class="header">
                <h1>Danh sách các nhà cung cấp đang lưu trữ</h1>
            </div>
            <table class="myTable display">
                <thead>
                <tr>
                    <th>Mã nhà cung cấp</th>
                    <th>Tên nhà cung cấp</th>
                    <th>Thông tin liên hệ</th>
                    <th>Địa chỉ nhà cung cấp</th>
                    <th>Tình trạng</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${archiveSupplier}" var="ar_sup">
                    <tr>
                        <td>${ar_sup.supplierID}</td>
                        <td>${ar_sup.supplierName}</td>
                        <td>${ar_sup.contactInfo != null ? ar_sup.contactInfo : 'N/A'}</td>
                        <td>${ar_sup.address != null ? ar_sup.address : 'N/A'}</td>
                        <td>

                            <c:if test="${ar_sup.isDeleted==1}">
                                <p class="text-danger m-0">Đang lưu trữ</p>
                            </c:if>
                        </td>
                        <td>
                            <a class="btn btn-success btn-sm"
                               href="<%=request.getContextPath()%>/admin/soft-delete?supplierID=${ar_sup.supplierID}&&option=1">Bỏ lưu trữ</a>
                            <a class="btn btn-danger btn-sm"
                               href="#"
                               onclick="return confirmDelete();">Xóa vĩnh viễn</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <!-- Archive Supplier -->
    </div>
</div>

<script>
    // Show form 'ADD' supplier
    function showSupplierAddForm() {
        // Show form
        document.getElementById("supplierAddModal").style.display = "block";
    }

    // Send request 'ADD' supplier
    document.getElementById('supplierAddForm').addEventListener('submit', async function (e) {
        e.preventDefault();
        let formData = new URLSearchParams(new FormData(this));
        let url = `${pageContext.request.contextPath}/admin/add-supplier`
        // if (!checkIsValidData(formData.get('dishName'), formData.get('dishPrice'))) return;

        try {
            let response = await fetch(url, {
                method: 'Post',
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: formData
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

    // Show form 'EDIT' supplier
    function showSupplierEditForm(id, name, info, address, createAt, updateAt) {
        document.getElementById("supplierId").value = id;
        document.getElementById("supplierName").value = name;
        document.getElementById("supplierInfo").value = info;
        document.getElementById("supplierAddress").value = address;
        document.getElementById("createAt").value = createAt;
        document.getElementById("updatedAt").value = updateAt

        // Show form
        document.getElementById("supplierEditModal").style.display = "block";
    }

    // Send request 'EDIT' supplier
    document.getElementById('supplierEditForm').addEventListener('submit', async function (e) {
        e.preventDefault();
        let formData = new URLSearchParams(new FormData(this));
        let url = `${pageContext.request.contextPath}/admin/update-supplier`
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

    // Helper function
    function closeModals(btnCancel) {
        let target = btnCancel.form.parentElement.parentElement;
        target.style.display = "none";
    }

    function openTableArchive() {
        let element = document.getElementById('archive-supplier');
        let currentDisplay = element.style.display;

        if (currentDisplay === 'none' || currentDisplay === '') {
            element.style.display = 'block';
        } else {
            element.style.display = 'none';
        }
    }

    function confirmDelete() {
        return confirm("Bạn có chắc chắn muốn xóa nhà cung cấp này?");
    }
</script>
</body>
</html>
