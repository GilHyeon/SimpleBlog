<%--
  Created by IntelliJ IDEA.
  User: Gilhyeon
  Date: 2017-03-04
  Time: 오후 3:24
  To change this template use File | Settings | File Templates.
--%>
<script type="text/javascript" src="<c:url value='/js/jquery-1.11.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/i18n/grid.locale-kr.js'/>"></script>
<script src="<c:url value='/js/jquery-ui-1.12.1.custom/jquery-ui.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.jqgrid-bootstrap.css'/>" />
<script language="JavaScript">
    function getFormattedDate(date) {
        var year = date.getFullYear();
        var month = (1 + date.getMonth()).toString();
        month = month.length > 1 ? month : '0' + month;
        var day = date.getDate().toString();
        day = day.length > 1 ? day : '0' + day;
        return year + '-' + month + '-' + day;
    }

    function getBlogDate(date) {
        var year = date.getFullYear();
        var monthNames = ["January", "February", "March", "April", "May", "June",
            "July", "August", "September", "October", "November", "December"
        ];
        var month = (1 + date.getMonth()).toString();
        month = month.length > 1 ? month : '0' + month;
        var day = date.getDate().toString();
        day = day.length > 1 ? day : '0' + day;
        return monthNames[date.getMonth()] +' ' + day + ', ' + year;
    }
</script>