<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn"
           uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý phân quyền</title>
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
    <style>
        .form-select.w-50 {
            background: transparent;
            color: var(--Heading);
        }

        .nav-link {
            color: #fff;
        }

        .nav-link:hover {
            color: #fff;

        }

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

        #myTab {
            display: grid;
            grid-template-columns: 2fr 1fr;
            border: none;
        }

        .tab-content {
            border: 1px solid #ccc;
        }

        [role="tabpanel"] {
            padding: 1.2rem;
        }

        input[name="roleIDs"] {
            margin-left: -1.5em;
        }
    </style>
</head>
<jsp:include page="header-admin.jsp"></jsp:include>
<body class="dark-theme">
<div id="main-content">
    <div class="main-container">
        <div class="header">
            <h1>Quản lý phân quyền hệ thống</h1>
        </div>
        <div class="mt-5">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="role-permission-tab" data-bs-toggle="tab"
                            data-bs-target="#role-permission" type="button" role="tab">Gán quyền
                    </button>
                </li>
                <li class="nav-item" role="presentation" style="margin-left: 3px">
                    <button class="nav-link active" id="user-role-tab" data-bs-toggle="tab" data-bs-target="#user-role"
                            type="button"
                            role="tab">Gán vai trò
                    </button>
                </li>
            </ul>

            <div class="tab-content">

                <div class="row">
                    <!-- GÁN QUYỀN CHO ROLE -->
                    <div class="col-md-8 border-end pe-4">
                        <div class="" id="role-permission" role="tabpanel">
                            <form method="post" action="<%=request.getContextPath()%>/admin/show-auth">
                                <div class="mb-3">
                                    <label>Chọn vai trò:</label>
                                    <select name="roleID" class="form-select w-50" id="roleSelect"
                                            onchange="handleSelectChange(this)">
                                        <option value="" disabled selected hidden>-- Chọn vai trò --</option>
                                        <c:forEach var="r" items="${roles}">
                                            <option value="${r.roleID}" ${r.roleID == selectedRoleID ? 'selected' : ''}>${r.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <table class="myTable">
                                    <thead>
                                    <tr>
                                        <th>Chức năng</th>
                                        <c:forEach var="act" items="${actions}">
                                            <th>${act.name}</th>
                                        </c:forEach>
                                        <th>All</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="func" items="${functions}">
                                        <tr>
                                            <td>${func}</td>
                                            <c:forEach var="act" items="${actions}">
                                                <td>
                                                    <c:set var="permID" value=""/>
                                                    <c:forEach var="perm" items="${allPermissions}">
                                                        <c:if test="${fn:trim(perm.functionName) == fn:trim(func) && perm.actionID == act.actionID}">
                                                            <c:set var="permID" value="${perm.permissionID}"/>
                                                        </c:if>
                                                    </c:forEach>

                                                    <c:set var="isChecked" value="false"/>
                                                    <c:forEach var="ap" items="${assignedPermissions}">
                                                        <c:if test="${ap.permissionID == permID}">
                                                            <c:set var="isChecked" value="true"/>
                                                        </c:if>
                                                    </c:forEach>

                                                    <input type="checkbox" name="permissions" value="${permID}"
                                                           <c:if test="${isChecked}">checked</c:if> />
                                                </td>
                                            </c:forEach>
                                            <td>
                                                <input type="checkbox" name="check-all" id="check-all"
                                                       onclick="allPermissionByFunction(this)"/>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>

                                <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                                <div class="my-3">
                                    <button type="button" class="btn btn-outline-secondary btn-sm"
                                            onclick="checkAll(true)">Chọn
                                        tất cả
                                    </button>
                                    <button type="button" class="btn btn-outline-secondary btn-sm"
                                            onclick="checkAll(false)">Bỏ chọn tất cả
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- GÁN ROLE CHO USER -->
                    <div class="col-md-4 ps-4">
                        <div class="" id="user-role" role="tabpanel">
                            <form method="post" action="<%=request.getContextPath()%>/admin/show-auth"
                                  id="add-user-role">
                                <div class="mb-3">
                                    <label>Chọn người dùng:</label>
                                    <select name="customerID" class="form-select w-50" id="customerSelect"
                                            onchange="handleSelectChange(this)">
                                        <option value="" disabled selected hidden>-- Chọn người dùng --</option>
                                        <c:forEach var="cus" items="${customers}">
                                            <option value="${cus.id}" ${cus.id == selectedCustomerID ? 'selected' : ''}>${cus.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label>Chọn vai trò:</label><br/>
                                    <c:forEach var="r" items="${roles}">
                                        <c:set var="isChecked" value="false"/>
                                        <c:forEach var="assigned" items="${assignedRoles}">
                                            <c:if test="${assigned.roleID == r.roleID}">
                                                <c:set var="isChecked" value="true"/>
                                            </c:if>
                                        </c:forEach>

                                        <div class="form-check">
                                            <input type="checkbox" name="roleIDs"
                                                   value="${r.roleID}"
                                                   <c:if test="${isChecked}">checked</c:if> />
                                            <label class="form-check-label">${r.name}</label>
                                        </div>
                                    </c:forEach>
                                </div>
                                <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                                <button type="button" class="btn btn-success" onclick="addRole(this)">Thêm vai trò mới
                                </button>
                            </form>
                            <form class="row g-3 mt-2 flex-column" id="add-role" style="display:none">
                                <div class="col-auto">
                                    <label for="inputPassword2" class="visually-hidden">Tên vai
                                        trò</label>
                                    <input type="text" class="form-control" id="inputPassword2" name="role-name"
                                           style="width: 45%" placeholder="Tên vai trò">
                                </div>
                                <div class="col-auto">
                                    <button type="submit" class="btn btn-primary mb-3" style="width: 45%">Lưu vai trò
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Loading Overlay -->
<div id="loadingOverlay" style="display:none;">
    <div class="spinner-border text-white" role="status">
        <span class="visually-hidden">Loading...</span>
    </div>
</div>
<script>
    <!-- Chọn/ Bỏ chọn tất cả   -->
    function checkAll(checked) {
        document.querySelectorAll('#role-permission input[type="checkbox"]').forEach(cb => cb.checked = checked);
    }

    function allPermissionByFunction(checkbox) {
        const isChecked = checkbox.checked;
        const row = checkbox.closest("tr");
        const checkboxes = row.querySelectorAll('input[type="checkbox"]:not(.manage-checkbox)');

        checkboxes.forEach(cb => {
            cb.checked = isChecked;
        });
    }

</script>
<script>
    <%-- Handle summit form, loading  --%>
    const loading = document.getElementById("loadingOverlay");
    // Khởi tạo Select2
    $('#roleSelect, #customerSelect').select2({
        allowClear: true,
        width: '35%'
    });


    // Khi thay đổi select -> delay rồi submit
    function handleSelectChange(selectEle) {
        const loading = document.getElementById("loadingOverlay");
        loading.style.display = "flex";
        setTimeout(() => {
            selectEle.form.submit();
        }, 500); // 0.5 giây
    }


    function addRole(btn) {
        let formAdd = document.getElementById('add-role')
        let display = window.getComputedStyle(formAdd).display;
        if (display === 'flex') {
            formAdd.style.display = 'none'
            btn.innerText = 'Thêm vai trò mới'
        } else {
            formAdd.style.display = 'flex'
            btn.innerText = 'Ẩn'
        }
    }
</script>
<script>
    // static variable


    <%-- Send form data --%>
    // ADD ROLE
    document.getElementById('add-role').addEventListener('submit', async function (e) {
        e.preventDefault();
        const loading = document.getElementById("loadingOverlay");
        let url = `${pageContext.request.contextPath}/admin/add-role`
        let formData = new URLSearchParams(new FormData(this))
        let value = formData.get("role-name").trim()
        let isValidRoleName = /^[A-Za-z\s]+$/.test(value);

        if (isValidRoleName) {
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
                    loading.style.display = "flex";
                    setTimeout(() => {
                        location.reload(); // hoặc window.location.reload()
                        alert("Thao tác thành công!");
                    }, 500);
                } else {
                    loading.style.display = "flex";
                    setTimeout(() => {
                        location.reload(); // hoặc window.location.reload()
                        alert("Thao tác thất bại!");
                    }, 500);

                }
            } catch (error) {
                console.log(error)
            }
        } else {
            alert('data format is wrong')
        }
    })

    // ADD USER_ROLE
    document.getElementById('add-user-role').addEventListener('submit', async function (e) {
        e.preventDefault();
        let url = `${pageContext.request.contextPath}/admin/add-user-role`
        let formData = new URLSearchParams(new FormData(this))
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
                loading.style.display = "flex";
                setTimeout(() => {
                    location.reload(); // hoặc window.location.reload()
                    alert("Thao tác thành công!");
                }, 500);
            } else {
                loading.style.display = "flex";
                setTimeout(() => {
                    location.reload(); // hoặc window.location.reload()
                    alert("Thao tác thất bại!");
                }, 500);

            }
        } catch (error) {
            console.log(error)
        }
    })
</script>
</body>
</html>
