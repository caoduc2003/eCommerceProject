<%-- Created by IntelliJ IDEA. User: brian Date: 10/12/2023 Time: 3:55 PM To change this template use File | Settings |
    File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
<!DOCTYPE html>
<html lang="en" data-theme="light">

<c:set var="ordersList" value="${requestScope.ordersList}"/>

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@3.8.1/dist/full.css" rel="stylesheet"
          type="text/css"/>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/d2b9bc7cdd.js" crossorigin="anonymous"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.13.1/dist/cdn.min.js"></script>
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

<!-- sidebar -->
<%@include file="Webpage-components/sidebar.jsp" %>

<!-- navbar -->
<div class="ml-64 sticky top-0 right-0 z-[1]">
    <%@include file="Webpage-components/navbar.jsp" %>
</div>

<!-- content -->
<div id="page-content" class="ml-64 p-5">

    <div class="w-full">
        <!-- state tabs -->
        <div class="tabs tabs-boxed">
            <a class="tab tab-active w-[14%]" id="tab-all" onclick="activateTab(this)">All</a>
            <a class="tab w-[14%]" id="tab-new" onclick="activateTab(this)">New</a>
            <a class="tab w-[14%]" id="tab-processing" onclick="activateTab(this)">Processing</a>
            <a class="tab w-[14%]" id="tab-shipping" onclick="activateTab(this)">Shipping</a>
            <a class="tab w-[14%]" id="tab-delivered" onclick="activateTab(this)">Delivered</a>
            <a class="tab w-[14%]" id="tab-cancelled" onclick="activateTab(this)">Cancelled</a>
            <a class="tab w-[14%]" id="tab-returned" onclick="activateTab(this)">Returned</a>
        </div>

        <div class="divider"></div>

        <!-- order cards -->
        <div class="w-full">
            <c:forEach var="order" items="${ordersList}">
                <div class="mx-auto w-[95%] h-[320px] bg-base-100 divide-y-2 divide-dashed rounded mb-5 drop-shadow-md order-card"
                     data-state="${order.getOrderStatus()}">
                    <div
                            class="w-full h-[50px] bg-base-100 flex items-center justify-between rounded">
                        <div class="flex items-baseline">
                            <p class="px-4 text-base">Order ID: ${order.getOrderID()}</p>
                            <div class="badge badge-sm">${order.getOrderStatus()}</div>
                        </div>
                        <div class="pr-5">
                            <button class="btn btn-sm rounded hover:btn-info">Info</button>
                            <button class="btn btn-sm rounded hover:btn-error">Cancel</button>
                            <button
                                    class="btn btn-sm rounded hover:btn-warning">Edit(Admin)
                            </button>
                        </div>
                    </div>
                    <div class="w-full h-[200px] flex items-center">
                        <div class="grow flex items-center px-5">
                            <div class="flex grow gap-3">
                                <div class="avatar">
                                    <div class="w-32 border">
                                        <img src="${order.getProductImage()}"
                                             alt="${order.getProductName()}"/>
                                    </div>
                                </div>
                                <div class="grow flex flex-col justify-between">
                                    <div class="text-xl">${order.getProductName()}
                                    </div>
                                    <div>
                                        <div>Qty: ${order.getQuantity()}</div>
                                        <div>Transport Unit: ${order.getTransportUnitName()}</div>
                                    </div>
                                </div>
                            </div>
                            <div class="text-base font-thin">
                                <fmt:setLocale value="vi_VN"/>
                                <fmt:formatNumber value="${order.getPrice()}" type="currency"
                                                  currencySymbol="₫" maxFractionDigits="0"/>
                            </div>
                        </div>
                    </div>
                    <div class="w-full flex flex-col justify-center"
                         style="height: calc(320px - 250px);">
                        <div class="flex flex-col items-end px-5">
                            <div class="font-thin">
                                Shipping fee: <span class="text-[17px]">
                                                        <fmt:setLocale value="vi_VN"/>
                                                        <fmt:formatNumber value="${order.getShippingFee()}"
                                                                          type="currency" currencySymbol="₫"
                                                                          maxFractionDigits="0"/>
                                                    </span>
                            </div>
                            <div class="text-xl font-semibold">
                                Total price: <span class="text-2xl">
                                                        <fmt:setLocale value="vi_VN"/>
                                                        <fmt:formatNumber value="${order.getProductOrderTotalPrice()}"
                                                                          type="currency" currencySymbol="₫"
                                                                          maxFractionDigits="0"/>
                                                    </span>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <script>
        function activateTab(tab) {
            // Remove the 'tab-active' class from all tabs
            const tabs = document.querySelectorAll('.tab');
            tabs.forEach(tab => {
                tab.classList.remove('tab-active');
            });
            // Add 'tab-active' class to the clicked tab
            tab.classList.add('tab-active');
            const tabID = tab.getAttribute('id');
            const orders = document.querySelectorAll('.order-card');
            orders.forEach(order => {
                const orderState = order.getAttribute('data-state');
                if (tabID === 'tab-all' || orderState === capitalizeFirstLetter(tabID.substring(4))) {
                    order.classList.remove('hidden'); // Show the order
                } else {
                    order.classList.add('hidden'); // Hide the order
                }
            });
        }

        function capitalizeFirstLetter(str) {
            return str.charAt(0).toUpperCase() + str.slice(1);
        }
    </script>

</div>
</body>

</html>