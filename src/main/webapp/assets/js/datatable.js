// JS datatable
$(document).ready(function () {
    $("#myTable").DataTable({
        language: {
            info: "Hiển thị _START_ đến _END_ của _TOTAL_ mục",
            zeroRecords: "Không tìm thấy dữ liệu",
            search: "Tìm kiếm",
            lengthMenu: " _MENU_ mục",
            infoEmpty: "Không có dữ liệu để hiển thị",
            emptyTable:"Không có dữ liệu để hiển thị"
        },

    });

    $("#myTable2").DataTable({
        language: {
            info: "Hiển thị _START_ đến _END_ của _TOTAL_ mục",
            zeroRecords: "Không tìm thấy dữ liệu",
            search: "Tìm kiếm",
            lengthMenu: " _MENU_ mục",
            infoEmpty: "Không có dữ liệu để hiển thị",
            emptyTable:"Không có dữ liệu để hiển thị"
        },

    });

    $(".myTable").DataTable({
        language: {
            info: "Hiển thị _START_ đến _END_ của _TOTAL_ mục",
            zeroRecords: "Không tìm thấy dữ liệu",
            search: "Tìm kiếm",
            lengthMenu: " _MENU_ mục",
            infoEmpty: "Không có dữ liệu để hiển thị",
            emptyTable:"Không có dữ liệu để hiển thị"
        },

    });
});