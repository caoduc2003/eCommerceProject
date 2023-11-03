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
<c:set var="users" value="${requestScope.usersList}"/>

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@3.8.1/dist/full.css" rel="stylesheet"
          type="text/css"/>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/d2b9bc7cdd.js" crossorigin="anonymous"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.13.1/dist/cdn.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
            <h2 class="text-2xl font-bold">User Management</h2>
            <p class="text-base font-thin">
                Manage user accounts and roles
            </p>
        </div>
        <div>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/user-management/create">
                <i class="fa-solid fa-plus"></i>
                <span>Create User</span>
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
                    <th>Account ID</th>
                    <th>Account Name</th>
                    <th>Email</th>
                    <th>Date Created</th>
                    <th>Role</th>
                    <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <!-- row 1 -->
                <c:forEach var="user" items="${users}">
                    <tr id="row-${user.getUserID()}">
                        <td>${user.getUserID()}</td>
                        <td>
                            <div class="flex items-center space-x-3">
                                <div class="avatar">
                                    <div class="mask mask-squircle w-12 h-12">
                                        <img src="${user.getProfilePicture()}"
                                             alt="${user.getFullName()}'s avatar"/>
                                    </div>
                                </div>
                                <div>
                                    <div class="font-bold">${user.getFullName()}</div>
                                </div>
                            </div>
                        </td>
                        <td>
                                ${user.getEmail()}
                            <br/>
                            <span
                                    class="badge badge-ghost badge-sm">${user.getPhoneNum()}</span>
                        </td>
                        <td>${user.getDateCreated()}</td>
                        <td>
                            <c:choose>
                                <c:when test="${user.getRole() == 'Admin'}">
                                    <span class="badge badge-sm bg-red-600">Admin</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge badge-ghost badge-sm">User</span>
                                </c:otherwise>
                            </c:choose>

                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${user.getAccountStatus() == 'Active'}">
                                    <span class="badge badge-success badge-sm">Active</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge badge-error badge-sm">Banned</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="join">
                            <a class="btn join-item hover:btn-info"
                               href="${pageContext.request.contextPath}/user-management/update?id=${user.getUserID()}">
                                <i class="fa-solid fa-pen-to-square"></i>
                            </a>
                            <a class="btn join-item hover:btn-error" onclick="hiddenRow(this)">
                                <i class="fa-solid fa-trash"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
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
                const userID = row.id.split("-")[1]; // Extract the userID from the row ID
                console.log(userID);
                htmx.ajax('POST', '${pageContext.request.contextPath}/user-management/delete', {
                    swap: 'none',
                    values: {
                        id: userID
                    }
                });

                row.classList.add("hidden");
            }
        })
    }
</script>
</body>

</html>