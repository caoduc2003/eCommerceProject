<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if(session.getAttribute("user") != null) response.sendRedirect("${pageContext.request.contextPath}/home");
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en" data-theme="light">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buylicious|Login</title>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@3.8.1/dist/full.css" rel="stylesheet" type="text/css"/>
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
                <div class="form-control mt-6">
                    <button class="btn btn-primary btn-outline" name="btAction" id="loginButton"
                            onclick="login()">Login
                    </button>
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
    const email = document.querySelector('input[name="txtEmail"]');
    const password = document.querySelector('input[name="txtPassword"]');
    const loginButton = document.getElementById('loginButton');

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
</body>

</html>