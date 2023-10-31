<%-- Created by IntelliJ IDEA. User: brian Date: 10/12/2023 Time: 3:55 PM To change this template use File | Settings |
  File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="cartItems" value="${requestScope.cartItems}"/>
<c:set var="totalPrice" value="${requestScope.total}"/>

<!DOCTYPE html>
<html lang="en" data-theme="light">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@3.8.1/dist/full.css" rel="stylesheet" type="text/css"/>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/d2b9bc7cdd.js" crossorigin="anonymous"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.13.1/dist/cdn.min.js"></script>
    <script src="https://unpkg.com/htmx.org@1.9.6"
            integrity="sha384-FhXw7b6AlE/jyjlZH5iHa/tTe9EpJ1Y55RjcgPbjeWMskSxZt1v9qkxLJWNJaGni"
            crossorigin="anonymous"></script>
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
    <style>
        @layer utilities {

            input[type="number"]::-webkit-inner-spin-button,
            input[type="number"]::-webkit-outer-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }
        }
    </style>
    <title>Document</title>
</head>

<body>
<%@ include file="Webpage-components/navbar.jsp" %>

<!-- main content -->
<main class="container mx-auto">
    <div class="pt-4">
        <div class="text-base breadcrumbs">
            <ul>
                <li><a>Home</a></li>
                <li><a>Documents</a></li>
                <li class="text-slate-500">Cart</li>
            </ul>
        </div>
    </div>

    <div class="h-screen pt-2">
        <!-- Title -->
        <h1 class="mb-10 text-center text-2xl font-bold">Cart Items</h1>

        <!-- Cart items/Subtotal -->
        <div class="w-full md:flex md:space-x-6 xl:px-0">
            <!-- Cart items -->
            <div class="md:w-2/3">
                <div class="rounded-lg">
                    <c:choose>
                        <c:when test="${cartItems == null}">
                            <div class="flex justify-center items-center h-96">
                                <p class="text-2xl text-gray-500">No items in cart</p>
                            </div>
                        </c:when>

                        <c:otherwise>
                            <c:forEach items="${cartItems}" var="items">
                                <div class="justify-between mb-6 rounded-lg bg-white p-6 shadow-md sm:flex sm:justify-start">
                                    <img src="${items.product.productImage}" alt="product-image"
                                         class="w-full rounded-lg sm:w-40"/>
                                    <div class="sm:ml-4 sm:flex sm:w-full sm:justify-between">
                                        <div class="mt-5 sm:mt-0">
                                            <h2 class="text-lg font-bold text-gray-900">
                                                    ${items.product.productName}
                                            </h2>
                                        </div>
                                        <div class="mt-4 flex justify-between sm:space-y-6 sm:mt-0 sm:block sm:space-x-6">
                                            <div class="flex items-center border-gray-100">
                                  <span
                                          class="cursor-pointer rounded-l bg-gray-100 py-1 px-3.5 duration-100 hover:bg-blue-500 hover:text-blue-50">
                                    -
                                  </span>
                                                <input class="h-8 w-8 border bg-white text-center text-xs outline-none"
                                                       type="number"
                                                       value="${items.quantity}" min="1"/>
                                                <span
                                                        class="cursor-pointer rounded-r bg-gray-100 py-1 px-3 duration-100 hover:bg-blue-500 hover:text-blue-50">
                                    +
                                  </span>
                                            </div>
                                            <div class="flex items-center space-x-4">
                                                <p class="text-sm">
                                                    <fmt:setLocale value="vi_VN"/>
                                                    <fmt:formatNumber
                                                            value="${(items.product.productPrice) * (items.quantity)}"
                                                            type="currency" maxFractionDigits="0" currencySymbol="₫"/>
                                                </p>
                                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                                     stroke-width="1.5" stroke="currentColor"
                                                     class="h-5 w-5 cursor-pointer duration-150 hover:text-red-500">
                                                    <path stroke-linecap="round" stroke-linejoin="round"
                                                          d="M6 18L18 6M6 6l12 12"/>
                                                </svg>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>

            <!-- Subtotal -->
            <div class="md:w-1/3 flex justify-center">
                <div class="rounded-lg border bg-white p-6 shadow-md w-[80%]">
                    <div class="mb-2 flex justify-between">
                        <p class="text-gray-700">Subtotal</p>
                        <p class="text-gray-700">
                            <fmt:setLocale value="vi_VN"/>
                            <fmt:formatNumber value="${total}" type="currency" maxFractionDigits="0"
                                              currencySymbol="₫"/>
                        </p>
                    </div>
                    <!-- <div class="flex justify-between">
                <p class="text-gray-700">Shipping</p>
                <p class="text-gray-700">$4.99</p>
              </div> -->
                    <hr class="my-4"/>
                    <div class="flex justify-between">
                        <p class="text-lg font-bold">Total</p>
                        <div class="">
                            <p class="mb-1 text-lg font-bold">
                                <fmt:setLocale value="vi_VN"/>
                                <fmt:formatNumber value="${total}" type="currency" maxFractionDigits="0"
                                                  currencySymbol="₫"/>
                            </p>
                            <p class="text-sm text-gray-700">including VAT</p>
                        </div>
                    </div>
                    <div class="w-full mt-4">
                        <button class="btn btn-primary btn-block" onclick="goCheckout()">checkout</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script>
    function goCheckout() {
        window.location.href = "checkout";
    }
</script>
<%@ include file="Webpage-components/footer.jsp" %>
</body>

</html>