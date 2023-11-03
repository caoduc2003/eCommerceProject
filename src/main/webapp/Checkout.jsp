<%-- Created by IntelliJ IDEA. User: brian Date: 10/12/2023 Time: 3:56 PM To change this template use File | Settings |
  File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="cartItems" value="${requestScope.cartItems}"/>
<c:set var="totalPrice" value="${requestScope.total}"/>
<c:set var="transportUnits" value="${requestScope.transportUnits}"/>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>

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
    <title>Checkout</title>
</head>

<body>
<%@ include file="Webpage-components/navbar.jsp" %>
<main class="container mx-auto">
    <!-- Breadcrumb -->
    <div class="pt-4">
        <div class="text-base breadcrumbs">
            <ul>
                <li><a>Home</a></li>
                <li><a>Documents</a></li>
                <li><a>Cart</a></li>
                <li class="text-slate-500">Checkout</li>
            </ul>
        </div>
    </div>

    <!-- Checkout section -->
    <div class="mt-4">
        <div class="grid grid-cols-[55%_minmax(30%,_1fr)] gap-4">
            <!-- Left side -->
            <div class="w-full h-full pr-2">
                <div class="w-full h-full">
                    <div>
                        <h1 class="text-2xl font-bold">Checkout</h1>
                    </div>

                    <div class="divider"></div>

                    <div>
                        <h2 class="text-base font-semibold">Shipping info</h2>
                    </div>

                    <div class="name-section flex items-center gap-4 mt-7">
                        <div class="form-control w-full">
                            <label class="label">
                                <span class="label-text">Firstname</span>
                            </label>
                            <input type="text" placeholder="Firstname" class="input input-bordered w-full"
                                   id="first-name"/>

                        </div>

                        <div class="form-control w-full">
                            <label class="label">
                                <span class="label-text">Lastname</span>
                            </label>
                            <input type="text" placeholder="Lastname" class="input input-bordered w-full"
                                   id="last-name"/>
                        </div>
                    </div>

                    <div class="contact-section flex gap-4">
                        <div class="form-control w-full min-w-[65%]">
                            <label class="label">
                                <span class="label-text">Email</span>
                            </label>
                            <input type="text" placeholder="Email" class="input input-bordered w-full" id="email"/>
                        </div>

                        <!-- copy this block for easy styling! -->
                        <div class="form-control w-full">
                            <label class="label">
                                <span class="label-text">Phone</span>
                            </label>
                            <input type="tel" placeholder="Phone number" class="input input-bordered w-full"
                                   id="phone-num"/>
                        </div>
                    </div>

                    <div class="address-section">
                        <div class="form-control w-full">
                            <label class="label">
                                <span class="label-text">Address</span>
                            </label>
                            <input type="text" placeholder="Address" class="input input-bordered w-full"
                                   id="address-line"/>
                        </div>

                        <div class="flex gap-4">
                            <div class="form-control w-1/3">
                                <label class="label">
                                    <span class="label-text">Country</span>
                                </label>
                                <input type="text" placeholder="Country" class="input input-bordered w-full"
                                       id="country"/>
                            </div>
                            <div class="form-control w-1/3">
                                <label class="label">
                                    <span class="label-text">City</span>
                                </label>
                                <input type="text" placeholder="City" class="input input-bordered w-full" id="city"/>
                            </div>
                            <div class="form-control w-1/3">
                                <label class="label">
                                    <span class="label-text">District</span>
                                </label>
                                <input type="text" placeholder="District" class="input input-bordered w-full"
                                       id="district"/>
                            </div>
                        </div>

                        <div class="flex gap-32 mt-6 justify-between">
                            <div class="form-control w-fit">
                                <label class="label cursor-pointer gap-x-2">
                                    <input type="checkbox" checked="checked"
                                           class="checkbox checkbox-primary checkbox-xs"/>
                                    <span class="label-text">Save this address to your address list</span>
                                </label>
                            </div>
                            <div class="form-control w-fit">
                                <label class="label cursor-pointer gap-x-2">
                                    <input type="checkbox" checked="checked"
                                           class="checkbox checkbox-primary checkbox-xs"/>
                                    <span class="label-text">Use this address as default</span>
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="divider"></div>

                    <!-- SHIPPING METHOD -->
                    <div>
                        <h2 class="text-base font-semibold">Shipping method</h2>
                    </div>

                    <div class="Shipping-method flex flex-wrap gap-4 pt-7">
                        <c:forEach items="${transportUnits}" var="tu">
                            <label class="card w-[40%] bg-base-200 card-bordered">
                                <div>
                                    <input type="radio" name="transport-unit"
                                           class="absolute top-4 right-4 radio radio-sm radio-primary"
                                           value="${tu.transportUnitID}"
                                           id="tu-${tu.transportUnitID}"/>
                                </div>

                                <div class="card-body">
                                    <h2 class="card-title">${tu.tuType}</h2>
                                    <p>From ${tu.tuMinShipTime} - ${tu.tuMaxShipTime} business days</p>
                                    <p>Shipping unit: ${tu.transportUnitName}</p>
                                    <h2 class="font-thin">
                                        <fmt:setLocale value="vi_VN"/>
                                        <fmt:formatNumber value="${tu.tuShipCost}" type="currency" currencySymbol="₫"
                                                          maxFractionDigits="0"/>
                                    </h2>
                                </div>
                            </label>
                        </c:forEach>
                    </div>

                    <div class="divider"></div>

                    <!-- PAYMENT INFO -->
                    <div>
                        <h2 class="text-base font-semibold">Payment method</h2>
                        <div class="pt-7">
                            <div class="form-control bg-base-200 rounded-lg h-16">
                                <label class="label cursor-pointer gap-4 items-center h-full"
                                       style="justify-content: normal">
                                    <input type="radio" name="payment-method" class="radio checked:bg-red-500"
                                           value="QR"/>
                                    <div class="flex gap-2 items-center">
                                        <div class="w-14 h-6 flex items-center">
                                            <img src="./asset/images/Checkout/Payment_method/Logo VNPAY-QR.svg"
                                                 alt="VNPay_QR"/>
                                        </div>
                                        <span class="label-text">VNPay QR</span>
                                    </div>
                                </label>
                            </div>
                            <div class="divider">OR</div>
                            <div class="form-control bg-base-200 rounded-lg h-16">
                                <label class="label cursor-pointer gap-4 items-center h-full"
                                       style="justify-content: normal">
                                    <input type="radio" name="payment-method" class="radio checked:bg-blue-500"
                                           value="COD"/>
                                    <div class="flex gap-2 items-center">
                                        <i class="fa-solid fa-wallet"></i>
                                        <span class="label-text">Cash on delivery(COD)</span>
                                    </div>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right side -->
            <div class="w-full h-full flex flex-col">
                <div>
                    <h1 class="text-2xl font-bold">Order summary</h1>
                </div>
                <div class="divider"></div>
                <!-- Order summary -->
                <div class="max-h-[60vh] w-full overflow-y-scroll overflow-x-hidden">
                    <ul class="bg-base-200 divide-y rounded-md divide-[#e5e7eb] border border-[#e5e7eb]">
                        <c:forEach items="${cartItems}" var="item">
                            <li class="flex w-full gap-4 p-4">
                                <div class="min-w-[80px] min-h-[120px] max-w-[80px] max-h-[120px] flex items-center">
                                    <!-- <div class="artboard artboard-demo">80x120</div> -->
                                    <img src="${item.product.productImage}" alt="${item.product.productName}"/>
                                </div>
                                <div class="flex flex-col grow">
                                    <div class="flex justify-between h-1/2">
                                        <div>
                                            <h2 class="text-base font-semibold truncate">
                                                    ${item.product.productName}
                                            </h2>
                                            <p class="truncate max-w-[300px]"
                                               title="${item.product.productDescription}">
                                                    ${item.product.productDescription}
                                            </p>
                                        </div>
                                        <div class="tooltip tooltip-error cursor-pointer" data-tip="delete">
                                            <i class="fa-regular fa-trash-can"></i>
                                        </div>
                                    </div>
                                    <div class="flex justify-between items-end h-1/2">
                                        <div class="font-thin">
                                            <fmt:setLocale value="vi_VN"/>
                                            <fmt:formatNumber value="${(item.product.productPrice) * (item.quantity)}"
                                                              type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                        </div>
                                        <div>
                                            <div class="custom-number-input h-10 w-32">
                                                <div class="flex flex-row h-10 w-full rounded-lg relative bg-transparent mt-1">
                                                    <button data-action="decrement"
                                                            class="bg-gray-300 text-gray-600 hover:text-gray-700 hover:bg-gray-400 h-full w-20 rounded-l cursor-pointer outline-none">
                                                        <span class="m-auto text-2xl font-thin">-</span>
                                                    </button>
                                                    <input id="order-quantity" type="number"
                                                           class="focus:outline-none text-center w-full bg-gray-300 font-semibold text-md hover:text-black focus:text-black md:text-basecursor-default flex items-center text-gray-700 outline-none"
                                                           name="custom-input-number" value="${item.quantity}" min="1"/>
                                                    <button data-action="increment"
                                                            class="bg-gray-300 text-gray-600 hover:text-gray-700 hover:bg-gray-400 h-full w-20 rounded-r cursor-pointer">
                                                        <span class="m-auto text-2xl font-thin">+</span>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="mt-5">
                    <div class="form-control">
                        <label class="label">
                            <span class="label-text">Note</span>
                        </label>
                        <textarea id="order-note" class="textarea textarea-bordered h-24"
                                  placeholder="Write your note for order here"></textarea>
                    </div>
                </div>
                <div class="mt-10">
                    <button class="btn btn-block btn-primary" id="checkout-btn">Confirm order</button>
                </div>
            </div>
        </div>
    </div>
</main>
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

<script>
    function decrement(e) {
        e.preventDefault();
        e.stopPropagation();
        const btn = e.target.parentNode.parentElement.querySelector(
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
        const btn = e.target.parentNode.parentElement.querySelector(
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
        return document.getElementById("order-quantity").value;
    }

    const swalWithDaisyUiBtn = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-primary btn-active mr-3',
            cancelButton: 'btn btn-error btn-active ml-3'
        },
        buttonsStyling: false
    })


    document.getElementById("checkout-btn").addEventListener("click", () => {
        swalWithDaisyUiBtn.fire({
            title: 'Do you want to submit the order?',
            text: "You won't be able to revert this!",
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: 'Yes',
            cancelButtonText: 'No',
            reverseButtons: false
        }).then((result) => {
            if (result.isConfirmed) {
                swalWithDaisyUiBtn.fire(
                    'Order submitted!',
                    'Your order has been submitted.',
                    'success'
                )
                // ajax submit
                htmx.ajax('POST', 'checkout/submit', {
                    swap: 'none', values: {
                        firstName: getFirstName(),
                        lastName: getLastName(),
                        email: getEmail(),
                        phoneNum: getPhoneNum(),
                        addressLine: getAddressLine(),
                        country: getCountry(),
                        city: getCity(),
                        district: getDistrict(),
                        note: getNote(),
                        paymentMethod: getPaymentMethod(),
                        transportUnit: getTransportUnit()
                    }
                }).then(() => {
                    sendUpdateCartMessage();
                }).then(() => {
                    setTimeout(() => {
                        window.location.href = "${pageContext.request.contextPath}/order";
                    }, 3000);
                })
            } else if (
                result.dismiss === Swal.DismissReason.cancel
            ) {
                swalWithDaisyUiBtn.fire(
                    'Cancelled',
                    'Now you can update your order!',
                    'info'
                )
            }
        })
    });

    // get value for ajax submit
    function getFirstName() {
        return document.getElementById("first-name").value;
    }

    function getLastName() {
        return document.getElementById("last-name").value;
    }

    function getEmail() {
        return document.getElementById("email").value;
    }

    function getPhoneNum() {
        return document.getElementById("phone-num").value;
    }

    function getAddressLine() {
        return document.getElementById("address-line").value;
    }

    function getCountry() {
        return document.getElementById("country").value;
    }

    function getCity() {
        return document.getElementById("city").value;
    }

    function getDistrict() {
        return document.getElementById("district").value;
    }

    function getNote() {
        return document.getElementById("order-note").value;
    }

    function getPaymentMethod() {
        const paymentMethod = document.getElementsByName("payment-method");
        for (let i = 0; i < paymentMethod.length; i++) {
            if (paymentMethod[i].checked) {
                return paymentMethod[i].value;
            }
        }
    }

    function getTransportUnit() {
        const transportUnit = document.getElementsByName("transport-unit");
        for (let i = 0; i < transportUnit.length; i++) {
            if (transportUnit[i].checked) {
                return transportUnit[i].value;
            }
        }
    }

    const uID = "${currUser.userID}";
    var message = {
        action: "update-cart",
        userID: uID
    };

    function sendUpdateCartMessage() {
        socket.send(JSON.stringify(message));
    }
</script>
<%@ include file="Webpage-components/footer.jsp" %>
</body>

</html>