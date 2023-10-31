<%@ page import="com.ecommerce.models.User" %><%-- Created by IntelliJ IDEA. User: brian Date: 10/12/2023 Time: 3:46 PM To
change this template use File | Settings | File Templates. --%>
<%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
    }
        User user = (User) session.getAttribute("user");
        String name = user.getFullName();
%>
<!-- <!DOCTYPE html>
<html data-theme="light">
<head>
    <meta charset="UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <link
            href="https://cdn.jsdelivr.net/npm/daisyui@3.8.1/dist/full.css"
            rel="stylesheet"
            type="text/css"
    />
    <script src="https://cdn.tailwindcss.com"></script>
    <script
            src="https://kit.fontawesome.com/d2b9bc7cdd.js"
            crossorigin="anonymous"
    ></script>
    <script
            defer
            src="https://cdn.jsdelivr.net/npm/alpinejs@3.13.1/dist/cdn.min.js"
    ></script>
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
    <script src="https://unpkg.com/htmx.org@1.9.6" integrity="sha384-FhXw7b6AlE/jyjlZH5iHa/tTe9EpJ1Y55RjcgPbjeWMskSxZt1v9qkxLJWNJaGni" crossorigin="anonymous"></script>
    <title>Navbar</title>
</head>
<body> -->
<div
        class="navbar bg-base-100 flex-col md:justify-around md:flex-row z-10 sticky top-0 left-0 right-0"
>
    <div>
        <a href="home" class="btn btn-ghost no-animation" style="font-size: 24px; text-transform: none;">Buylicious</a>
    </div>

    <div class="join xl:w-2/5 md:w-1/2">
        <!-- searchbar -->
        <div class="w-full">
            <div class="w-full">
                <input
                        class="input input-bordered join-item w-full rounded-lg"
                        placeholder="Search for products"
                />
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
                    <svg
                            xmlns="http://www.w3.org/2000/svg"
                            class="h-5 w-5"
                            fill="none"
                            viewBox="0 0 24 24"
                            stroke="currentColor"
                    >
                        <path
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="2"
                                d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"
                        ></path>
                    </svg>
                    <span class="badge badge-sm indicator-item">8</span>
                </div>
            </label>
            <div
                    tabindex="0"
                    class="mt-3 z-[1] card card-compact dropdown-content w-52 bg-base-100 shadow"
            >
                <div class="card-body">
                    <span class="font-bold text-lg">8 Items</span>
                    <span class="text-info">Subtotal: $999</span>
                    <div class="card-actions">
                        <button class="btn btn-primary btn-block" onclick="viewCart()">View cart</button>
                        <script>
                            function viewCart() {
                                window.location.href = "cart";
                            }
                        </script>
                    </div>
                </div>
            </div>
        </div>
        <div class="dropdown dropdown-end">
            <label tabindex="0">
                <div tabindex="0" class="btn btn-ghost no-animation">
                    <div class="avatar">
                        <div class="w-10 rounded-full">
                            <img src=""/>
                        </div>
                    </div>
                    <div
                            class="ml-[10px] flex normal-case items-center justify-center rounded-lg"
                    >
                        <div class="flex flex-col">
                            <div class="text-xs text-left">Hello,</div>
                            <div class="text-base font-semibold"><%=name%>
                            </div>
                        </div>
                    </div>
                </div>
            </label>
            <ul
                    tabindex="0"
                    class="menu menu-sm dropdown-content mt-3 z-[1] p-2 shadow bg-base-100 rounded-box w-52"
            >
                <li>
                    <a href="profile" class="justify-between">
                        Profile
                        <span class="badge">New</span>
                    </a>
                </li>
                <li><a>Settings</a></li>
                <li><a href="logout">Logout</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- </body>
</html> -->
