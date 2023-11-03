<%-- Created by IntelliJ IDEA. User: brian Date: 10/12/2023 Time: 3:55 PM To change this template use File | Settings |
    File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User sessionUser = (User) request.getSession().getAttribute("user");
    if (sessionUser == null || !("admin".equalsIgnoreCase(sessionUser.getRole()))) {
        response.sendRedirect(request.getContextPath() + "/home");
        return;
    }
%>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
<!DOCTYPE html>
<html lang="en" data-theme="light">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="transportUnits" value="${requestScope.transportUnitsList}"/>

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@3.8.1/dist/full.css" rel="stylesheet"
          type="text/css"/>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/d2b9bc7cdd.js" crossorigin="anonymous"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.13.1/dist/cdn.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <script>
        module.exports = {
            plugins: [require("daisyui")],
            // daisyUI config (optional - here are the default values)
            daisyui: {
                themes: ["light", "dark", "cupcake"], // true: all themes | false: only light + dark | array: specific themes like this ["light", "dark", "cupcake"]
                darkTheme: "dark", // name of one of the included themes for dark mode
                base: true, // applies background color and foreground color for root element by default
                styled: true, // include daisyUI colors and design decisions for all components
                utils: true, // adds responsive and modifier utility classes
                rtl: false, // rotate style direction from left-to-right to right-to-left. You also need to add dir="rtl" to your html tag and install `tailwindcss-flip` plugin for Tailwind CSS.
                prefix: "", // prefix for daisyUI classnames (components, modifiers and responsive class names. Not colors)
                logs: true, // Shows info about daisyUI version and used config in the console when building your CSS
            },
        };
    </script>
    <script src="https://unpkg.com/htmx.org@1.9.6"
            integrity="sha384-FhXw7b6AlE/jyjlZH5iHa/tTe9EpJ1Y55RjcgPbjeWMskSxZt1v9qkxLJWNJaGni"
            crossorigin="anonymous"></script>

    <title>Profile</title>
</head>

<body>
<%@include file="../Webpage-components/sidebar.jsp" %>
<div class="ml-64 sticky top-0 right-0 z-[1]">
    <%@include file="../Webpage-components/navbar.jsp" %>
</div>
<!-- content -->
<div id="page-content" class="ml-64 p-5">
    <div class="flex justify-between items-center">
        <div>
            <h2 class="text-2xl font-bold">Transport Unit Management</h2>
            <p class="text-base font-thin">
                Manage transport units and their shipping costs
            </p>
        </div>
        <div>
            <a class="btn btn-primary"
               href="${pageContext.request.contextPath}/products-management/create">
                <i class="fa-solid fa-plus"></i>
                <span>Create TU</span>
            </a>
        </div>
    </div>

    <div class="divider"></div>

    <div class="w-full">
        <div>
            <table class="table">
                <!-- head -->
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Transport Unit Name</th>
                    <th>Ship Cost</th>
                    <th>Ship Time</th>
                    <th>Type</th>
                </tr>
                </thead>
                <tbody>
                <!-- row 1 -->
                <c:forEach var="tu" items="${transportUnits}">
                    <tr id="row-${tu.getTransportUnitID()}">
                        <td>
                                ${tu.getTransportUnitID()}
                        </td>
                        <td>
                            <div class="flex items-center space-x-3">
                                <div class="max-w-xs">
                                    <div class="truncate">
                                        <div class="font-bold">${tu.getTransportUnitName()}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td>
                            <fmt:setLocale value="vi_VN"/>
                            <fmt:formatNumber value="${tu.getTuShipCost()}" type="currency"
                                              currencySymbol="₫" maxFractionDigits="0"/>
                        </td>
                        <td>${tu.getTuMinShipTime()} - ${tu.getTuMaxShipTime()} days</td>
                        <td>${tu.getTuType()}</td>
                        <td class="join">
                            <a class="btn join-item hover:btn-info"
                               href="${pageContext.request.contextPath}/transport-unit-management/update?tuID=${tu.getTransportUnitID()}">
                                <i class="fa-solid fa-pen-to-square"></i>
                            </a>
                            <a class="btn join-item hover:btn-error" onclick="hiddenRow(this)">
                                <i class="fa-solid fa-trash"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>

                <!-- row 2 -->

                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    function hiddenRow(button) {
        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire(
                    'Deleted!',
                    'User has been deleted.',
                    'success'
                )

                const row = button.closest("tr");
                const id = row.id.split("-")[1]; // Extract the id of the product
                htmx.ajax('POST', '${pageContext.request.contextPath}/transport-unit-management/delete', {
                    swap: 'none',
                    values: {
                        id: id
                    }
                });

                row.classList.add("hidden");
            }
        })
    }
</script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
</body>

</html>