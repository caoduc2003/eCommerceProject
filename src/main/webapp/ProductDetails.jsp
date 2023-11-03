<%@ page import="com.ecommerce.models.Products" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%-- Created by IntelliJ IDEA. User: brian Date:
          10/12/2023 Time: 3:55 PM To change this template use File | Settings | File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
<c:set var="product" value="${requestScope.productDetails}"/>
<!DOCTYPE html>
<html lang="en" data-theme="light">

<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@3.8.1/dist/full.css" rel="stylesheet" type="text/css"/>
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
    <title>${product.productName}</title>
</head>

<body class="font-sans">
<%@ include file="Webpage-components/navbar.jsp" %>

<!-- content -->
<main class="container mx-auto">
    <div>
        <div class="pt-6">
            <nav aria-label="Breadcrumb">
                <ol role="list"
                    class="mx-auto flex max-w-2xl items-center space-x-2 px-4 sm:px-6 lg:max-w-7xl lg:px-8">
                    <li>
                        <div class="flex items-center">
                            <a href="${pageContext.request.contextPath}/home"
                               class="mr-2 text-sm font-medium text-gray-900">Home</a>
                            <svg width="16" height="20" viewBox="0 0 16 20" fill="currentColor" aria-hidden="true"
                                 class="h-5 w-4 text-gray-300">
                                <path d="M5.697 4.34L8.98 16.532h1.327L7.025 4.341H5.697z"/>
                            </svg>
                        </div>
                    </li>
                    <li>
                        <div class="flex items-center">
                            <a href="${pageContext.request.contextPath}/productslist"
                               class="mr-2 text-sm font-medium text-gray-900">Products</a>
                            <svg width="16" height="20" viewBox="0 0 16 20" fill="currentColor" aria-hidden="true"
                                 class="h-5 w-4 text-gray-300">
                                <path d="M5.697 4.34L8.98 16.532h1.327L7.025 4.341H5.697z"/>
                            </svg>
                        </div>
                    </li>

                    <li class="text-sm">
                        <a onclick="window.location.reload()" aria-current="page"
                           class="font-medium text-gray-500 hover:text-gray-600 cursor-pointer">${product.productName}</a>
                    </li>
                </ol>
            </nav>

            <!-- Product image gallery/Choose variant -->

            <div class="grid grid-cols-2 mt-8">
                <!-- Image gallery -->
                <div class="flex items-center">
                    <div class="sr-only">Image gallery</div>
                    <div class="grid gap-4 w-[90%] mx-auto">
                        <div>
                            <img class="h-auto max-w-full rounded-lg" src="${product.productImage}"
                                 alt="${product.productName}"/>
                        </div>
                        <div class="grid grid-cols-5 gap-4">
                            <div>
                                <img class="h-auto max-w-full rounded-lg"
                                     src="https://flowbite.s3.amazonaws.com/docs/gallery/square/image-1.jpg" alt=""/>
                            </div>
                            <div>
                                <img class="h-auto max-w-full rounded-lg"
                                     src="https://flowbite.s3.amazonaws.com/docs/gallery/square/image-2.jpg" alt=""/>
                            </div>
                            <div>
                                <img class="h-auto max-w-full rounded-lg"
                                     src="https://flowbite.s3.amazonaws.com/docs/gallery/square/image-3.jpg" alt=""/>
                            </div>
                            <div>
                                <img class="h-auto max-w-full rounded-lg"
                                     src="https://flowbite.s3.amazonaws.com/docs/gallery/square/image-4.jpg" alt=""/>
                            </div>
                            <div>
                                <img class="h-auto max-w-full rounded-lg"
                                     src="https://flowbite.s3.amazonaws.com/docs/gallery/square/image-5.jpg" alt=""/>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Choose variant -->
                <div class="w-full h-full flex justify-center">
                    <div class="max-w-[80%] max-h-full mt-4 lg:row-span-3 lg:mt-0 flex-grow">
                        <h2 class="sr-only">Product information</h2>
                        <p class="text-3xl tracking-tight text-gray-900">
                            ${product.productName}
                        </p>

                        <!-- Reviews -->
                        <div class="mt-6">
                            <h3 class="sr-only">Reviews</h3>
                            <div class="flex items-center">
                                <div class="flex items-center">
                                    <!-- Active: "text-gray-900", Default: "text-gray-200" -->
                                    <svg class="text-gray-900 h-5 w-5 flex-shrink-0" viewBox="0 0 20 20"
                                         fill="currentColor" aria-hidden="true">
                                        <path fill-rule="evenodd"
                                              d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                              clip-rule="evenodd"/>
                                    </svg>
                                    <svg class="text-gray-900 h-5 w-5 flex-shrink-0" viewBox="0 0 20 20"
                                         fill="currentColor" aria-hidden="true">
                                        <path fill-rule="evenodd"
                                              d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                              clip-rule="evenodd"/>
                                    </svg>
                                    <svg class="text-gray-900 h-5 w-5 flex-shrink-0" viewBox="0 0 20 20"
                                         fill="currentColor" aria-hidden="true">
                                        <path fill-rule="evenodd"
                                              d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                              clip-rule="evenodd"/>
                                    </svg>
                                    <svg class="text-gray-900 h-5 w-5 flex-shrink-0" viewBox="0 0 20 20"
                                         fill="currentColor" aria-hidden="true">
                                        <path fill-rule="evenodd"
                                              d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                              clip-rule="evenodd"/>
                                    </svg>
                                    <svg class="text-gray-200 h-5 w-5 flex-shrink-0" viewBox="0 0 20 20"
                                         fill="currentColor" aria-hidden="true">
                                        <path fill-rule="evenodd"
                                              d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                              clip-rule="evenodd"/>
                                    </svg>
                                </div>
                                <p class="sr-only">4 out of 5 stars</p>
                                <a href="#" class="ml-3 text-sm font-medium text-indigo-600 hover:text-indigo-500">117
                                    reviews</a>
                            </div>

                            <div class="w-full h-16 flex items-center bg-base-200 mt-5 rounded-lg">
                                <p class="text-3xl text-red-600 font-semibold pl-5">
                                    <fmt:setLocale value="vi_VN"/>
                                    <fmt:formatNumber value="${product.productPrice}" type="currency" currencySymbol="₫"
                                                      maxFractionDigits="0"/>
                                </p>
                            </div>
                        </div>

                        <!-- Product description -->
                        <form class="mt-10">
                            <div>
                                <div class="custom-number-input h-10 w-32">
                                    <div class="flex flex-row h-10 w-full rounded-lg relative bg-transparent mt-1">
                                        <button data-action="decrement"
                                                class="bg-gray-300 text-gray-600 hover:text-gray-700 hover:bg-gray-400 h-full w-20 rounded-l cursor-pointer outline-none">
                                            <span class="m-auto text-2xl font-thin">-</span>
                                        </button>
                                        <input id="order-quantity" type="number"
                                               class="focus:outline-none text-center w-full bg-gray-300 font-semibold text-md hover:text-black focus:text-black md:text-basecursor-default flex items-center text-gray-700 outline-none"
                                               name="custom-input-number" value="1" min="1"/>
                                        <button data-action="increment"
                                                class="bg-gray-300 text-gray-600 hover:text-gray-700 hover:bg-gray-400 h-full w-20 rounded-r cursor-pointer">
                                            <span class="m-auto text-2xl font-thin">+</span>
                                        </button>
                                    </div>

                                    <style>
                                        input[type="number"]::-webkit-inner-spin-button,
                                        input[type="number"]::-webkit-outer-spin-button {
                                            -webkit-appearance: none;
                                            margin: 0;
                                        }

                                        .custom-number-input input:focus {
                                            outline: none !important;
                                        }

                                        .custom-number-input button:focus {
                                            outline: none !important;
                                        }
                                    </style>
                                </div>
                                <div class="flex justify-center w-full mt-5">
                                    <button id="addToCart-btn" class="btn btn-primary w-full" style="font-weight: 700"
                                            hx-post="cart/add"
                                            hx-vals='js:{quantity: getOrderQuantity(), "productId": "${product.productID}"}'
                                            hx-swap="none">
                                        Add to cart
                                    </button>
                                    <script>
                                        // ========= CUSTOM NUMBER INPUT =========
                                        function decrement(e) {
                                            e.preventDefault();
                                            e.stopPropagation();
                                            const btn =
                                                e.target.parentNode.parentElement.querySelector(
                                                    'button[data-action="decrement"]'
                                                );
                                            const target = btn.nextElementSibling;
                                            let value = Number(target.value);
                                            value--;
                                            if (value < 1) {
                                                value = 1;
                                            }
                                            target.value = value;
                                        }

                                        function increment(e) {
                                            e.preventDefault();
                                            e.stopPropagation();
                                            const btn =
                                                e.target.parentNode.parentElement.querySelector(
                                                    'button[data-action="decrement"]'
                                                );
                                            const target = btn.nextElementSibling;
                                            let value = Number(target.value);
                                            value++;
                                            target.value = value;
                                        }

                                        const decrementButtons = document.querySelectorAll(
                                            `button[data-action="decrement"]`
                                        );

                                        const incrementButtons = document.querySelectorAll(
                                            `button[data-action="increment"]`
                                        );

                                        decrementButtons.forEach((btn) => {
                                            btn.addEventListener("click", decrement);
                                        });

                                        incrementButtons.forEach((btn) => {
                                            btn.addEventListener("click", increment);
                                        });

                                        function getOrderQuantity() {
                                            return document.getElementById("order-quantity")
                                                .value;
                                        }

                                        // ========= PREPARE WEBSOCKET =========

                                        const uID = "${currUser.userID}";
                                        var message = {
                                            action: "update-cart",
                                            userID: uID
                                        };

                                        // ========== AJAX + WEBSOCKET ==========
                                        htmx.onLoad(function (elt) {
                                            htmx.on(elt, "htmx:afterOnLoad", function (evt) {
                                                var xhr = evt.detail.xhr;
                                                var responseText = xhr.responseText;
                                                switch (responseText) {
                                                    case "added":
                                                        socket.send(JSON.stringify(message));
                                                        Swal.fire({
                                                            toast: true,
                                                            icon: "success",
                                                            title: "Added to cart successfully!",
                                                            position: "top-start",
                                                            showConfirmButton: false,
                                                            timer: 5000,
                                                            timerProgressBar: true,
                                                            didOpen: (toast) => {
                                                                toast.addEventListener("mouseenter", Swal.stopTimer);
                                                                toast.addEventListener("mouseleave", Swal.resumeTimer);
                                                            },
                                                        });
                                                        break;
                                                    case "error":
                                                        Swal.fire({
                                                            toast: true,
                                                            icon: "error",
                                                            title: "Something not right, please try again!",
                                                            position: "top-start",
                                                            showConfirmButton: false,
                                                            timer: 3000,
                                                            timerProgressBar: true,
                                                            didOpen: (toast) => {
                                                                toast.addEventListener("mouseenter", Swal.stopTimer);
                                                                toast.addEventListener("mouseleave", Swal.resumeTimer);
                                                            },
                                                        });
                                                        break;
                                                    default:
                                                        alert("Error");
                                                        break;
                                                }
                                            });
                                        });
                                    </script>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<%@ include file="Webpage-components/footer.jsp" %>
</body>

</html>