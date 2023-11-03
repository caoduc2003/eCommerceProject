<%-- Created by IntelliJ IDEA. User: brian Date: 10/12/2023 Time: 3:55 PM To change this template use File | Settings |
    File Templates. --%>
<%
    User sessionUser = (User) request.getSession().getAttribute("user");
    if (sessionUser == null || !("admin".equalsIgnoreCase(sessionUser.getRole()))) {
        response.sendRedirect(request.getContextPath() + "/home");
        return;
    }
%>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" data-theme="light">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@3.8.1/dist/full.css" rel="stylesheet"
          type="text/css"/>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/d2b9bc7cdd.js" crossorigin="anonymous"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.13.1/dist/cdn.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0"/>
    <title>Profile</title>
</head>
<body>
<div>
    <%@include file="../Webpage-components/sidebar.jsp" %>
</div>
<div class="ml-64 sticky top-0 right-0 z-[1]">
    <%@include file="../Webpage-components/navbar.jsp" %>
</div>
<!-- content -->
<div id="page-content" class="ml-64 mt-[3rem] h-screen flex bg-base-100 items-center justify-center">
    <div class="w-[95%] bg-base-100 drop-shadow-md pb-10">
        <div class="w-[94%] pt-10 mx-auto">
            <div class="flex justify-between">
                <div class="text-2xl font-semibold">
                    Update your profile
                </div>
                <div>
                    <ul class="menu menu-horizontal rounded-box gap-2 bg-base-100">
                        <li>
                            <button class="btn btn-sm btn-primary" onclick="createUser()">Save
                            </button>
                        </li>
                        <li>
                            <button class="btn btn-sm btn-error">Cancel</button>
                        </li>
                        <li>
                            <button class="btn btn-sm btn-secondary">Reset</button>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="divider"></div>
            <div class="w-[90%] h-[80%] mt-10 mx-auto flex items-center">
                <div class="basis-3/4">
                    <form action="">
                        <div>
                            <div class="flex flex-col gap-y-5">
                                <div class="flex">
                                    <div class="w-[150px] flex justify-end mr-7 shrink-0">
                                        <label for="username" class="label">Username</label>
                                    </div>
                                    <input type="text" id="username" name="username"
                                           class="input input-bordered rounded-none w-[50%]"
                                           placeholder="Username" required/>

                                </div>

                                <div class="flex">
                                    <div class="w-[150px] flex justify-end mr-7">
                                        <label for="firstname" class="label">Name</label>
                                    </div>
                                    <div>
                                        <input type="text" id="firstname" name="firstname"
                                               class="input input-bordered rounded-none"
                                               placeholder="Firstname" required/>
                                        <input type="text" id="lastname" name="lastname"
                                               class="input input-bordered rounded-none"
                                               placeholder="Lastname" required/>
                                    </div>
                                </div>

                                <div class="flex">
                                    <div class="w-[150px] flex justify-end mr-7 shrink-0">
                                        <label for="email" class="label">Email</label>
                                    </div>
                                    <input type="email" id="email" name="email"
                                           class="input input-bordered rounded-none w-[50%]"
                                           placeholder="Email" required/>
                                </div>
                                <div class="flex">
                                    <div class="w-[150px] flex justify-end mr-7">
                                        <label for="phonenum" class="label">Phone number</label>
                                    </div>
                                    <input type="tel" id="phonenum" name="phonenum"
                                           class="input input-bordered rounded-none"
                                           placeholder="Phone number" required/>
                                </div>
                                <div class="flex">
                                    <div class="w-[150px] flex justify-end mr-7">
                                        <label class="label">Gender</label>
                                    </div>
                                    <div class="flex gap-4">
                                        <div class="flex items-center gap-3">
                                            <input type="radio" name="userGender"
                                                   class="radio radio-sm checked:bg-blue-500" value="Male"
                                                   checked/>
                                            <span class="label-text">Male</span>
                                        </div>
                                        <div class="flex items-center gap-3">
                                            <input type="radio" name="userGender"
                                                   class="radio radio-sm checked:bg-blue-500"
                                                   value="Female"/>
                                            <span class="label-text">Female</span>
                                        </div>
                                        <div class="flex items-center gap-3">
                                            <input type="radio" name="userGender"
                                                   class="radio radio-sm checked:bg-blue-500"
                                                   value="Other"/>
                                            <span class="label-text">Other</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="flex">
                                    <div class="w-[150px] flex justify-end mr-7">
                                        <label for="DoB" class="label">DoB</label>
                                    </div>
                                    <div>
                                        <input type="date" id="DoB" name="date"
                                               class="input input-bordered rounded-none" placeholder="Date"
                                               required/>
                                    </div>
                                </div>

                                <div class="flex">
                                    <div class="w-[150px] flex justify-end mr-7">
                                        <label for="userRole" class="label">Role</label>
                                    </div>
                                    <select class="select select-bordered rounded-none w-full max-w-xs"
                                            id="userRole">
                                        <option value="Admin">
                                            Admin
                                        </option>
                                        <option value="User" selected>
                                            User
                                        </option>
                                    </select>
                                </div>

                                <div class="flex items-center">
                                    <div class="w-[150px] flex justify-end mr-7">
                                        <label for="password" class="label">Password</label>
                                    </div>
                                    <input type="password" id="password" name="password"
                                           class="input input-bordered rounded-none"
                                           placeholder="Enter password"/>
                                </div>


                                <div class="flex" id="cfpwd">
                                    <div class="w-[150px] flex justify-end mr-7">
                                        <label for="cfpassword" class="label">Confirm
                                            password</label>
                                    </div>
                                    <input type="password" id="cfpassword" name="cfpassword"
                                           class="input input-bordered rounded-none"
                                           placeholder="Confirm password" required/>

                                    <div class="hidden items-center ml-3 gap-3" id="notMatch">
                                                        <span class="material-symbols-outlined text-red-700">
                                                            error
                                                        </span>
                                        <span class="text-red-700">Password does not
                                                            match.</span>
                                    </div>

                                    <div class="hidden items-center ml-3 gap-3" id="pwdMatch">
                                                        <span class="material-symbols-outlined text-green-600">
                                                            done
                                                        </span>
                                        <span class="text-green-600">Password matches</span>
                                    </div>

                                </div>

                                <div class="flex">
                                    <div class="w-[150px] flex justify-end mr-7">
                                        <label for="accStatus" class="label">Account
                                            status</label>
                                    </div>
                                    <select class="select select-bordered rounded-none w-full max-w-xs"
                                            id="accStatus">
                                        <option value="Active" selected>Active
                                        </option>
                                        <option value="Banned">Banned
                                        </option>
                                    </select>
                                </div>

                            </div>
                        </div>
                    </form>
                </div>

                <div class="divider divider-horizontal m-0"></div>

                <div class="flex grow justify-center">
                    <div class="flex flex-col items-center gap-2">
                        <div class="avatar">
                            <div class="w-24 rounded-full">
                                <img id="userAvt" src=""/>
                            </div>
                        </div>
                        <div x-data>
                            <button class="btn btn-primary btn-outline btn-sm w-24"
                                    @click="openFilePicker">
                                Change
                            </button>
                            <input x-ref="filePicker" type="file" class="hidden"
                                   accept=".jpg,.png,.jpeg"/>
                        </div>
                        <div class="text-xs">
                            <p>Maximum file size: 1 MB <br/>
                                Format: .JPEG, .PNG</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <script>

        // =========== File picker  ===========
        function openFilePicker() {
            this.$refs.filePicker.click();
        }

        // Get file input element and display the selected image
        const fileInput = document.querySelector('input[type="file"]');
        let base64String;
        fileInput.addEventListener('change', (e) => {
            const file = e.target.files[0];
            const reader = new FileReader();
            reader.onload = (e) => {
                base64String = e.target.result;
                const img = document.getElementById('userAvt');
                img.src = base64String;
            }
            reader.readAsDataURL(file);
        });

        // =========== GET REQUIRED DATA ===========
        const inputPassword = document.getElementById('password')
        const cfInputPassword = document.getElementById('cfpassword')
        const cfpwd = document.getElementById('cfpwd')
        const pwdMatch = document.getElementById('pwdMatch')
        const notMatch = document.getElementById('notMatch')

        function checkAllInput() {
            if (getUsername() === '' || getFirstname() === '' ||
                getLastname() === '' || getEmail() === '' || getPhoneNum() === ''
                || getGender() === '' || getDoB() === '' || getRole() === '' || getPassword() === ''
                || getAccountStatus() === '') {
                return false;
            } else {
                return true;
            }
        }

        function getUsername() {
            return document.getElementById('username').value;
        }

        function getFirstname() {
            return document.getElementById('firstname').value;
        }

        function getLastname() {
            return document.getElementById('lastname').value;
        }

        function getEmail() {
            return document.getElementById('email').value;
        }

        function getPhoneNum() {
            return document.getElementById('phonenum').value;
        }

        function getGender() {
            const radios = document.getElementsByName('userGender');
            for (let i = 0; i < radios.length; i++) {
                if (radios[i].checked) {
                    return radios[i].value;
                }
            }
        }

        function getDoB() {
            return document.getElementById('DoB').value;
        }

        function getRole() {
            return document.getElementById('userRole').value;
        }

        function getProfilePicture() {
            return document.getElementById('userAvt').src;
        }

        function getAccountStatus() {
            return document.getElementById('accStatus').value;
        }

        const defautPasword = '12345678';

        function getPassword() {
            if ((inputPassword.value === cfInputPassword.value) && (inputPassword.value !== defautPasword)
                && (cfInputPassword.value !== defautPasword) && (inputPassword.value !== '') && (cfInputPassword.value !== '')
            ) {
                return inputPassword.value;
            } else {
                return defautPasword;
            }
        }


        cfInputPassword.addEventListener('input', (e) => {
            if (cfInputPassword.value !== inputPassword.value) {
                cfInputPassword.classList.add('border-red-700');
                cfInputPassword.classList.remove('border-green-600');
                notMatch.classList.remove('hidden');
                notMatch.classList.add('flex');
                pwdMatch.classList.remove('flex');
                pwdMatch.classList.add('hidden');
            } else {
                cfInputPassword.classList.remove('border-red-700');
                cfInputPassword.classList.add('border-green-600');
                notMatch.classList.remove('flex');
                notMatch.classList.add('hidden');
                pwdMatch.classList.remove('hidden');
                pwdMatch.classList.add('flex');
            }
        });


        function createUser() {
            if (checkAllInput()) {
                htmx.ajax('POST', '${pageContext.request.contextPath}/user-management/submit-create', {
                    swap: 'none', values: {
                        firstName: getFirstname(),
                        lastName: getLastname(),
                        username: getUsername(),
                        dob: getDoB(),
                        email: getEmail(),
                        password: getPassword(),
                        role: getRole(),
                        phoneNum: getPhoneNum(),
                        gender: getGender(),
                        accountStatus: getAccountStatus(),
                        profilePicture: getProfilePicture(),
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
                    case "created":
                        Swal.fire({
                            icon: 'success',
                            title: 'Updated successfully!',
                            text: 'Your data have been updated.',
                            footer: '<a href="${pageContext.request.contextPath}/user-management">Back to user management page</a>'
                        })
                        break;
                    case "error":
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Something went wrong!',
                            footer: '<a href="https://www.un.org/en/contact-us-0" target="_blank">Cannot create? Contact us</a>'
                        })
                        break;
                    default:
                        break;
                }
            });
        });
    </script>
</div>
<!-- end content -->
<div class="mt-40">
    <%@ include file="../Webpage-components/footer.jsp" %>
</div>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
</body>
</html>