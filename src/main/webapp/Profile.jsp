<%-- Created by IntelliJ IDEA. User: brian Date: 10/12/2023 Time: 3:55 PM To change this template use File | Settings |
  File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div class="ml-64 sticky top-0 right-0">
    <%@include file="Webpage-components/navbar.jsp" %>
</div>

<%@include file="Webpage-components/sidebar.jsp" %>

<!-- content -->
<div id="page-content" class="ml-64 p-5">
    <div>
        <h2 class="text-2xl font-bold">Profile</h2>
        <p class="text-base font-thin">
            Manage profile information for account security
        </p>
    </div>

    <div class="divider"></div>

    <div class="w-full flex">
        <div class="basis-3/5">
            <form action="">
                <div>
                    <div class="flex flex-col gap-y-5">
                        <div class="flex">
                            <div class="w-[150px]">
                                <label for="username" class="label">Username</label>
                            </div>
                            <input type="text" id="username" name="username" class="input input-bordered"
                                   placeholder="Username"
                                   required/>
                        </div>

                        <div class="flex">
                            <div class="w-[150px]">
                                <label for="firstname" class="label">Name</label>
                            </div>
                            <div>
                                <input type="text" id="firstname" name="firstname" class="input input-bordered"
                                       placeholder="Firstname" required/>
                                <input type="text" id="lastname" name="lastname" class="input input-bordered"
                                       placeholder="Lastname" required/>
                            </div>
                        </div>

                        <div class="flex">
                            <div class="w-[150px]">
                                <label for="email" class="label">Email</label>
                            </div>
                            <input type="email" id="email" name="email" class="input input-bordered" placeholder="Email"
                                   required/>
                        </div>
                        <div class="flex">
                            <div class="w-[150px]">
                                <label for="phonenum" class="label">Phone number</label>
                            </div>
                            <input type="tel" id="phonenum" name="phonenum" class="input input-bordered"
                                   placeholder="Phone number" required/>
                        </div>

                        <div class="flex">
                            <div class="w-[150px]">
                                <label for="DoB" class="label">DoB</label>
                            </div>
                            <div>
                                <input type="number" id="DoB" name="date" class="input input-bordered"
                                       placeholder="Date" required
                                       min="1" max="31"/>
                                <input type="number" name="month" class="input input-bordered" placeholder="Month"
                                       required
                                       min="1" max="12"/>
                                <input type="number" name="year" class="input input-bordered" placeholder="Year"
                                       required
                                       min="1900" max="2023"/>
                            </div>
                        </div>
                        <div class="flex w-3/4 justify-start ml-[150px]">
                            <button type="submit" class="btn btn-primary btn-outline w-24">
                                Save
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <div>
            <div class="avatar">
                <div class="w-24 rounded-full">
                    <img src="${currUser.profilePicture}"/>
                </div>
            </div>
            <div x-data>
                <button class="btn btn-primary btn-outline w-24" @click="openFilePicker">
                    Change
                </button>
                <input x-ref="filePicker" type="file" class="hidden" accept=".jpg,.png,.jpeg"/>
            </div>
        </div>
    </div>

</div>

<script>
    function openFilePicker() {
        this.$refs.filePicker.click();
    }
</script>
</body>

</html>