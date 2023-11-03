<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.ecommerce.models.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Created by IntelliJ IDEA. User: brian Date: 10/12/2023 Time: 3:46 PM To change this template
    use File | Settings | File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login");
    }
%>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
<c:set var="currUser" value="${sessionScope.user}"/>
<div
        class="navbar bg-base-100 flex-col md:justify-around md:flex-row z-10 sticky top-0 left-0 right-0">
    <div>
        <a href="home" class="btn btn-ghost no-animation"
           style="font-size: 24px; text-transform: none;">Buylicious</a>
    </div>

    <div class="join xl:w-2/5 md:w-1/2">
        <!-- searchbar -->
        <div class="w-full">
            <div class="w-full">
                <input class="input input-bordered join-item w-full rounded-lg"
                       placeholder="Search for products"/>
            </div>
        </div>
        <select class="select select-bordered join-item">
            <option disabled selected>Filter</option>
            <option>Sci-fi</option>
            <option>Drama</option>
            <option>Action</option>
        </select>
        <div class="indicator">
            <button class="btn join-item">Search</button>
        </div>
    </div>

    <div class="flex flex-end">
        <div class="dropdown dropdown-end">
            <label tabindex="0" class="btn btn-ghost btn-circle">
                <div class="indicator">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none"
                         viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              stroke-width="2"
                              d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z">
                        </path>
                    </svg>
                    <span class="badge badge-sm indicator-item"
                          id="cart-badge"></span>
                </div>
            </label>
            <div tabindex="0"
                 class="mt-3 z-[1] card card-compact dropdown-content w-52 bg-base-100 shadow">
                <div class="card-body">
                                                    <span class="font-bold text-lg" id="item-count">
                                                        Items</span>
                    <span class="text-info" id="total-amount">
                                                        Total:
                                                    </span>
                    <div class="card-actions">
                        <button class="btn btn-primary btn-block"
                                onclick="viewCart()">View cart
                        </button>

                    </div>
                </div>
            </div>
        </div>
        <div class="dropdown dropdown-end">
            <label tabindex="0">
                <div tabindex="0" class="btn btn-ghost no-animation">
                    <div class="avatar">
                        <div class="w-10 rounded-full">
                            <img src="${currUser.profilePicture}"/>
                        </div>
                    </div>
                    <div
                            class="ml-[10px] flex normal-case items-center justify-center rounded-lg">
                        <div class="flex flex-col">
                            <div class="text-xs text-left">Hello,</div>
                            <div class="text-base font-semibold">
                                ${currUser.fullName}
                            </div>
                        </div>
                    </div>
                </div>
            </label>
            <ul tabindex="0"
                class="menu menu-sm dropdown-content mt-3 z-[1] p-2 shadow bg-base-100 rounded-box w-52">
                <li>
                    <a href="account" class="justify-between">
                        Profile
                        <span class="badge">New</span>
                    </a>
                </li>
                <li><a>Settings</a></li>
                <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
            </ul>
        </div>
    </div>
</div>
<script>
    const socket = new WebSocket("ws://localhost:8080/eCommerceProject/cart-preview");

    const cartBadge = document.getElementById("cart-badge");
    const itemCount = document.getElementById("item-count");
    const totalAmount = document.getElementById("total-amount");
    const id = "${currUser.userID}";

    var messageOnLoad = {
        action: "update-cart",
        userID: id
    };

    socket.onopen = function () {
        socket.send(JSON.stringify(messageOnLoad));
    };

    socket.onmessage = function (event) {
        var updateObj = JSON.parse(event.data);
        console.log(updateObj);
        cartBadge.innerText = updateObj.itemCount;
        itemCount.innerText = updateObj.itemCount + " Items";
        totalAmount.innerText = "Total: " + formatCurrency(updateObj.cartTotal);
    };

    socket.onclose = function (event) {
        console.log("WebSocket connection is closed.");
    };

    socket.onerror = function (error) {
        console.error("WebSocket error: " + error.message);
    };



    // ========== Helper function ==========
    function formatCurrency(number) {
        return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(number);
    }

    function viewCart() {
        window.location.href = "cart";
    }

    function viewProfile() {
        window.location.href = "account/profile";
    }
</script>