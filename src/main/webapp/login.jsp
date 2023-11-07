<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.*" %>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if (session.getAttribute("user") != null)
        response.sendRedirect("${pageContext.request.contextPath}/home"); %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en" data-theme="light">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buylicious|Login</title>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@3.8.1/dist/full.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/d2b9bc7cdd.js" crossorigin="anonymous"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.13.1/dist/cdn.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://unpkg.com/htmx.org@1.9.6"
            integrity="sha384-FhXw7b6AlE/jyjlZH5iHa/tTe9EpJ1Y55RjcgPbjeWMskSxZt1v9qkxLJWNJaGni"
            crossorigin="anonymous"></script>
    src/main/webapp/login.jsp
    <script>
        module.exports = {
            // add daisyUI plugin
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
        }
    </script>
</head>

<body class="overflow-y-hidden">
<!-- navbar fixed here -->
<div class="navbar bg-base-100 fixed top-0 m-0 flex justify-around z-10">
    <!-- "Logo" -->
    <div>
        <a class="btn btn-ghost normal-case text-xl">Buylicious</a>
        <span class="ml-1 mr-4">|</span>
        <span class="mt-1">Login</span>
    </div>
    <!-- Help portal -->
    <div>
        <a href="https://www.un.org/en/contact-us-0" target="_blank" class="no-underline text-orange-700">
            <i class="fa-regular fa-circle-question"></i>
            Need help?
        </a>
    </div>
</div>
<!-- main content -->
<div>
    <img src="asset/images/Login/login_background.jpg" alt="Cart and white background" class="absolute">
</div>
<div class="hero min-h-screen bg-base-200">
    <div class="hero-content flex-col justify-between lg:flex-row-reverse">
        <div class="text-center lg:text-left basis-1/2">
            <h1 class="text-5xl font-bold">
                Endless shopping experience!</h1>
            <p class="py-6">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nemo eveniet veniam
                reiciendis
                maxime? Repudiandae doloribus ipsam excepturi aperiam id, voluptates, repellat, ducimus
                quaerat
                saepe facilis delectus dolorem ipsa debitis quas.</p>
        </div>
        <div class="card flex-shrink-0 w-full max-w-sm shadow-2xl bg-base-100">
            <div class="card-body">
                <!-- <form action="login" method="POST"> -->
                <div class="form-control">
                    <label class="label">
                        <span class="label-text">Email</span>
                    </label>
                    <input type="email" placeholder="email" class="input input-bordered" name="txtEmail"/>
                </div>
                <div class="form-control">
                    <label class="label">
                        <span class="label-text">Password</span>
                    </label>
                    <input type="password" placeholder="password" class="input input-bordered"
                           name="txtPassword"/>
                    <label class="label">
                        <a href="#" class="label-text-alt link link-hover">Forgot password?</a>
                    </label>
                </div>
                <div class="flex flex-col justify-center mt-6">
                    <div class="form-control">
                        <button class="btn btn-primary btn-outline" name="btAction" id="loginButton"
                                onclick="login()">Login
                        </button>
                    </div>
                    <div class="divider font-semibold text-sm">OR</div>
                    <div class="form-control">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=profile email&redirect_uri=http://localhost:8080/eCommerceProject/login-google&response_type=code&client_id=432080739851-i90lscb3v0n6lrv551n210tise0a6drf.apps.googleusercontent.com&approval_prompt=force"
                           class="btn btn-primary btn-outline">
                            <img src="./asset/images/Login/icons8-google.svg" alt="Google logo"
                                 class="w-5 h-5">Sign in with Google
                        </a>
                    </div>
                </div>
                <div class="text-center mt-5">
                    Dont have an account?
                    <a href="${pageContext.request.contextPath}/register"
                       class="link link-hover text-blue-600">Sign up</a>
                </div>

                <!-- </form> -->
            </div>
        </div>
    </div>
</div>
<script>
    const notiSocket = new WebSocket("ws://localhost:8080/eCommerceProject/notification");

    notiSocket.onopen = function () {
        console.log("Toast is connected");
    };

    notiSocket.onmessage = function (event) {
        var toastObj = JSON.parse(event.data);
        console.log(toastObj);
        Toastify({
            text: toastObj.name + " has just ordered " + toastObj.totalItems + " products with a total amount of " + formatCurrency(toastObj.totalPrice)
                + " from Buylicious!",
            duration: 10000,
            close: true,
            gravity: "bottom", // `top` or `bottom`
            position: "right", // `left`, `center` or `right`
            stopOnFocus: true, // Prevents dismissing of toast on hover
            className: "w-[350px] break-words",
            style: {
                background: "linear-gradient(to right, #00b09b, #96c93d)",
            },
            onClick: function () {
            } // Callback after click
        }).showToast();
    };

    notiSocket.onclose = function (event) {
        console.log("Toast is closed.");
    };

    notiSocket.onerror = function (error) {
        console.error("Toast error: " + error.message);
    };

    function formatCurrency(number) {
        return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(number);
    }

    const email = document.querySelector('input[name="txtEmail"]');
    const password = document.querySelector('input[name="txtPassword"]');
    const loginButton = document.getElementById('loginButton');
    const urlParams = new URLSearchParams(window.location.search);

    if(urlParams.has('error') && urlParams.get('error') === '1') {
        Swal.fire({
            toast: true,
            icon: "error",
            iconColor: "white",
            title: "You haven't registered your Google account. Please register your Google account and try again!",
            position: "top-end",
            showConfirmButton: false,
            color: "#fff",
            timer: 10000,
            timerProgressBar: true,
            background: "#b81c1c",
            didOpen: (toast) => {
                toast.addEventListener("click", Swal.close);
            }
        });
    }

    if (window.location.href === 'http://localhost:8080/eCommerceProject/login?error=1') {
        window.addEventListener('beforeunload', function (event) {
            event.preventDefault();
        });
    }

    email.addEventListener('change', function (event) {
        if (email.validity.typeMismatch) {
            email.classList.add("border-red-500");
        } else {
            email.classList.remove("border-red-500");
            email.setCustomValidity("");
        }
    });

    function checkAllInput() {
        return !(email.value === '' || password.value === '');
    }

    function login() {
        if (checkAllInput()) {
            htmx.ajax('POST', '${pageContext.request.contextPath}/login', {
                swap: 'none', values: {
                    email: email.value,
                    password: password.value
                }
            })
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Data missing!',
                text: 'You must fill in all the fields.',
                footer: '<a href="https://www.un.org/en/contact-us-0" target="_blank">Why I meet this error?</a>'
            })
        }
    }

    htmx.onLoad(function (elt) {
        htmx.on(elt, "htmx:afterOnLoad", function (evt) {
            var xhr = evt.detail.xhr;
            var responseText = xhr.responseText;
            switch (responseText) {
                case "already-logged":
                    window.open("${pageContext.request.contextPath}/home", "_self");
                    break;
                case "success":
                    window.open("${pageContext.request.contextPath}/home", "_self");
                    break;
                case "wrong-email":
                    Swal.fire({
                        toast: true,
                        icon: "error",
                        iconColor: "white",
                        title: "Your email is invalid. Please check again!",
                        position: "top-end",
                        showConfirmButton: false,
                        color: "#fff",
                        timer: 5000,
                        timerProgressBar: true,
                        background: "#b81c1c",
                        didOpen: (toast) => {
                            toast.addEventListener("click", Swal.close);
                        },
                    });
                    break;
                case "wrong-password":
                    Swal.fire({
                        toast: true,
                        icon: "error",
                        iconColor: "white",
                        title: "Your password is invalid. Please check again!",
                        position: "top-end",
                        showConfirmButton: false,
                        color: "#fff",
                        timer: 5000,
                        timerProgressBar: true,
                        background: "#b81c1c",
                        didOpen: (toast) => {
                            toast.addEventListener("click", Swal.close);
                        },
                    });
                    break;
                case "banned":
                    Swal.fire({
                        icon: "error",
                        iconColor: "white",
                        title: "Your account has been banned. Please contact admin for more information!",
                        position: "top-end",
                        showConfirmButton: true,
                        color: "#fff",
                        background: "#b81c1c"
                    });
                    break;
                default:
                    window.open("${pageContext.request.contextPath}/login", "_self");
                    break;
            }
        });
    });

    password.addEventListener('keyup', function (event) {
        if (event.key === 'Enter') {
            loginButton.click();
        }
    });

</script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
</body>

</html>