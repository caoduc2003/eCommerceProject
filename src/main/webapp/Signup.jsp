<%-- Created by IntelliJ IDEA. User: brian Date: 10/20/2023 Time: 4:24 PM To change this template use File | Settings |
    File Templates. --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate" );%>
            <!DOCTYPE html>
            <html data-theme="light">

            <head>
                <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
                <meta content="width=device-width, initial-scale=1.0" name="viewport" />
                <link href="https://cdn.jsdelivr.net/npm/daisyui@3.8.1/dist/full.css" rel="stylesheet"
                    type="text/css" />
                <script src="https://cdn.tailwindcss.com"></script>
                <script src="https://kit.fontawesome.com/d2b9bc7cdd.js" crossorigin="anonymous"></script>
                <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.13.1/dist/cdn.min.js"></script>
                <link rel="stylesheet"
                    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
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
                <title>Signup</title>
            </head>

            <body class="w-screen flex justify-center items-center overflow-x-hidden">
                <div class="card w-full max-w-[35rem] shadow-2xl bg-base-100">
                    <div class="card-body">
                        <div class="flex justify-center items-center pb-3">
                            <div class="card-title ">Sign up your Buylicious</div>
                        </div>

                        <div class="form-control">
                            <label class="label">
                                <span class="label-text">Email</span>
                            </label>
                            <input type="email" placeholder="email" class="input input-bordered" id="new-email" />
                        </div>

                        <div class="form-control">
                            <label class="label">
                                <span class="label-text">Phone number</span>
                            </label>
                            <input type="tel" placeholder="phone number" class="input input-bordered"
                                id="new-phonenum" />
                        </div>

                        <div class="flex items-center gap-3">
                            <div class="form-control basis-1/2">
                                <label class="label">
                                    <span class="label-text">Firstname</span>
                                </label>
                                <input type="text" placeholder="firstname" class="input input-bordered"
                                    id="new-fname" />
                            </div>
                            <div class="form-control basis-1/2">
                                <label class="label">
                                    <span class="label-text">Lastname</span>
                                </label>
                                <input type="text" placeholder="lastname" class="input input-bordered" id="new-lname" />
                            </div>
                        </div>

                        <div class="flex items-center gap-3">
                            <div class="form-control basis-3/5">
                                <label class="label">
                                    <span class="label-text">Username</span>
                                </label>
                                <input type="text" placeholder="username" class="input input-bordered" id="new-uname" />
                            </div>
                            <div class="form-control basis-2/5">
                                <label class="label">
                                    <span class="label-text">Date of birth</span>
                                </label>
                                <input type="date" class="input input-bordered" id="new-dob" />
                            </div>
                        </div>

                        <div class="flex pl-1 py-4">
                            <div class="flex justify-end mr-7">
                                <label class="label-text">Gender</label>
                            </div>
                            <div class="flex gap-4">
                                <div class="flex items-center gap-3">
                                    <input type="radio" name="userGender" class="radio radio-sm checked:bg-blue-500"
                                        value="Male" checked id="g-1" />
                                    <label class="label-text cursor-pointer" for="g-1">Male</label>
                                </div>
                                <div class="flex items-center gap-3">
                                    <input type="radio" name="userGender" class="radio radio-sm checked:bg-blue-500"
                                        value="Female" id="g-2" />
                                    <label class="label-text cursor-pointer" for="g-2">Female</label>
                                </div>
                                <div class="flex items-center gap-3">
                                    <input type="radio" name="userGender" class="radio radio-sm checked:bg-blue-500"
                                        value="Other" id="g-3" />
                                    <label class="label-text cursor-pointer" for="g-3">Other</label>
                                </div>
                            </div>
                        </div>


                        <div class="flex items-center gap-3">
                            <div class="form-control basis-1/2">
                                <label class="label">
                                    <span class="label-text">Password</span>
                                </label>
                                <input type="password" placeholder="password" class="input input-bordered"
                                    id="new-password" />
                            </div>
                            <div class="form-control basis-1/2">
                                <label class="label">
                                    <span class="label-text">Confirm password</span>
                                    <span class="label-text-alt material-symbols-outlined hidden"
                                        id="matchPassword">error</span>
                                </label>
                                <input type="password" placeholder="confirm password" class="input input-bordered"
                                    id="cf-new-password" />
                            </div>
                        </div>

                        <div class="mt-6 flex flex-col justify-center">
                            <div class="form-control">
                                <button class="btn btn-primary btn-outline" type="submit" onclick="registerUser()">
                                    Signup
                                </button>
                            </div>
                            <div class="divider">OR</div>
                            <div class="form-control tooltip tooltip-right" data-tip="Feature have been disabled due to Google security reason, if you want to use this feature, pls contact me at: ducldc@jsclub.dev">
                                <a href="https://accounts.google.com/o/oauth2/auth?scope=profile email&redirect_uri=http://localhost:8080/eCommerceProject/register-google&response_type=code&client_id=432080739851-i90lscb3v0n6lrv551n210tise0a6drf.apps.googleusercontent.com&approval_prompt=force"
                                    class="btn btn-primary btn-outline btn-disabled" disabled>
                                    <img src="./asset/images/Login/icons8-google.svg" alt="Google logo"
                                        class="w-5 h-5">Register with Google
                                </a>
                            </div>
                        </div>

                        <div class="text-center mt-5">
                            Already have an account?
                            <a href="${pageContext.request.contextPath}/login"
                                class="link link-hover text-blue-600">Sign in</a>
                        </div>
                    </div>
                </div>

                <script>
                    function getEmail() {
                        return document.getElementById("new-email").value;
                    }

                    function getPhoneNum() {
                        return document.getElementById("new-phonenum").value;
                    }

                    function getFname() {
                        return document.getElementById("new-fname").value;
                    }

                    function getLname() {
                        return document.getElementById("new-lname").value;
                    }

                    function getUname() {
                        return document.getElementById("new-uname").value;
                    }

                    function getDob() {
                        return document.getElementById("new-dob").value;
                    }

                    function getGender() {
                        const radios = document.getElementsByName("userGender");
                        for (let i = 0; i < radios.length; i++) {
                            if (radios[i].checked) {
                                return radios[i].value;
                            }
                        }
                        return "";
                    }

                    function getCfPassword() {
                        return document.getElementById("cf-new-password").value;
                    }

                    const inputPassword = document.getElementById("new-password");
                    const cfInputPassword = document.getElementById("cf-new-password");
                    const mpIcon = document.getElementById("matchPassword");

                    function checkAllInput() {
                        return !(getEmail() == "" || getPhoneNum() == "" || getFname() == ""
                            || getLname() == "" || getUname() == "" || getDob() == "" || getGender() == ""
                            || getPassword() == "" || getCfPassword() == "");
                    }

                    function getPassword() {
                        if (inputPassword.value !== cfInputPassword.value) {
                            return "";
                        } else {
                            return inputPassword.value;
                        }
                    }


                    cfInputPassword.addEventListener('input', (e) => {
                        if (cfInputPassword.value !== inputPassword.value) {
                            cfInputPassword.classList.add('border-red-700');
                            cfInputPassword.classList.remove('border-green-600');
                            mpIcon.classList.remove('hidden');
                            mpIcon.classList.remove('text-green-700');
                            mpIcon.classList.add('text-red-700');
                            mpIcon.innerText = "error";
                        } else {
                            cfInputPassword.classList.remove('border-red-700');
                            cfInputPassword.classList.add('border-green-600');
                            mpIcon.classList.remove('text-red-700');
                            mpIcon.classList.add('text-green-700');
                            mpIcon.innerText = "done";
                        }
                    });

                    function registerUser() {
                        if (checkAllInput()) {
                            htmx.ajax('POST', '${pageContext.request.contextPath}/register/submit-register', {
                                swap: 'none', values: {
                                    firstName: getFname(),
                                    lastName: getLname(),
                                    username: getUname(),
                                    dob: getDob(),
                                    email: getEmail(),
                                    password: getPassword(),
                                    phoneNum: getPhoneNum(),
                                    gender: getGender()
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
                                case "registered":
                                    Swal.fire({
                                        icon: 'success',
                                        title: 'Registered!',
                                        text: 'Your account have been registered.',
                                        showConfirmButton: false,
                                    })
                                    setTimeout(() => {
                                        window.location.href = "${pageContext.request.contextPath}/login";
                                    }, 5000);
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
            </body>

            </html>