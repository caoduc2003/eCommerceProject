<%-- Created by IntelliJ IDEA. User: brian Date: 10/12/2023 Time: 3:55 PM To change this template use File | Settings |
    File Templates. --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <!DOCTYPE html>
        <html lang="en" data-theme="light">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <link href="https://cdn.jsdelivr.net/npm/daisyui@3.8.1/dist/full.css" rel="stylesheet"
                    type="text/css" />
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

                <title>Profile</title>
            </head>

            <body>
                <%@include file="../Webpage-components/sidebar.jsp" %>
                    <div class="ml-64 sticky top-0 right-0 z-[1] mb-4">
                        <%@include file="../Webpage-components/navbar.jsp" %>
                    </div>
                    <!-- content -->
                    <div id="page-content" class="ml-64 h-screen flex bg-base-100 items-center justify-center">
                        <div class="w-[95%] h-[90%] bg-base-100 drop-shadow-md">
                            <div class="w-[94%] h-[98%] pt-10 mx-auto">
                                <div class="flex justify-between">
                                    <div class="text-2xl font-semibold">
                                        Update Transport Unit
                                    </div>
                                    <div>
                                        <ul class="menu menu-horizontal rounded-box gap-2 bg-base-100">
                                            <li>
                                                <button class="btn btn-sm btn-primary">Save</button>
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
                                <div class="w-[90%] h-[80%] mt-10 mx-auto flex items-centerư">
                                    <div class="basis-3/4">
                                        <form action="">
                                            <div>
                                                <div class="flex flex-col gap-y-5">
                                                    <div class="flex">
                                                        <div class="w-[150px] flex justify-end mr-7 shrink-0">
                                                            <label for="tuName" class="label">Unit Name</label>
                                                        </div>
                                                        <input type="text" id="tuName" name="tuName"
                                                            class="input input-bordered rounded-none w-[50%]"
                                                            placeholder="Transport unit name" required />

                                                    </div>
                                                    <div class="flex">
                                                        <div class="w-[150px] flex justify-end mr-7">
                                                            <label for="mShipTime" class="label">Min ship time</label>
                                                        </div>
                                                        <input type="number" id="mShipTime" name="mShipTime"
                                                            class="input input-bordered rounded-none"
                                                            placeholder="Min ship time" required min="1" />
                                                    </div>
                                                    <div class="flex">
                                                        <div class="w-[150px] flex justify-end mr-7">
                                                            <label for="mxShipTime" class="label">Max ship time</label>
                                                        </div>
                                                        <input type="number" id="mxShipTime" name="mxShipTime"
                                                            class="input input-bordered rounded-none"
                                                            placeholder="Max ship time" required min="1" />
                                                    </div>
                                                    <div class="flex">
                                                        <div class="w-[150px] flex justify-end mr-7">
                                                          <label for="shipCost" class="label">Ship cost</label>
                                                        </div>
                                                        <input type="number" id="shipCost" name="shipCost"
                                                               class="input input-bordered rounded-none"
                                                               placeholder="Ship cost" required min="1"/>
                                                      </div>

                                                    <div class="flex">
                                                        <div class="w-[150px] flex justify-end mr-7 grow-0">
                                                            <label for="tuType"
                                                                class="label">Type</label>
                                                        </div>
                                                        <select class="select select-bordered w-full max-w-xs rounded-none" name="tuType" id="tuType">
                                                            <option selected>Standard</option>
                                                            <option>Express</option>
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
                                                    <img src="${currUser.profilePicture}" />
                                                </div>
                                            </div>
                                            <div x-data>
                                                <button class="btn btn-primary btn-outline btn-sm w-24"
                                                    @click="openFilePicker">
                                                    Change
                                                </button>
                                                <input x-ref="filePicker" type="file" class="hidden"
                                                    accept=".jpg,.png,.jpeg" />
                                            </div>
                                            <div class="text-xs">
                                                <p>Maximum file size: 1 MB <br />
                                                    Format: .JPEG, .PNG</p>
                                            </div>
                                        </div>
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