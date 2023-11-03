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
<c:set var="p" value="${requestScope.product}"/>
<c:set var="ctList" value="${requestScope.ctList}"/>

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
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
                    Create new product
                </div>
                <div>
                    <ul class="menu menu-horizontal rounded-box gap-2 bg-base-100">
                        <li>
                            <button class="btn btn-sm btn-primary" onclick="createProduct()">Save</button>
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
                                        <label for="productName" class="label">Product Name</label>
                                    </div>
                                    <input type="text" id="productName" name="productName"
                                           class="input input-bordered rounded-none w-[50%]" placeholder="Product name"
                                           required/>
                                </div>

                                <div class="flex">
                                    <div class="w-[150px] flex justify-end mr-7">
                                        <label for="whichCategory" class="label">In category</label>
                                    </div>
                                    <select class="select select-bordered w-full max-w-xs rounded-none"
                                            name="whichCategory"
                                            id="whichCategory">
                                        <c:forEach var="ct" items="${ctList}">
                                            <option value="${ct.categoryID}">${ct.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="flex">
                                    <div class="w-[150px] flex justify-end mr-7">
                                        <label for="productPrice" class="label">Price</label>
                                    </div>
                                    <input type="number" id="productPrice" name="productPrice"
                                           class="input input-bordered rounded-none" placeholder="Product price"
                                           required min="1"/>
                                </div>
                                <div class="flex">
                                    <div class="w-[150px] flex justify-end mr-7 grow-0">
                                        <label for="productDescription" class="label">Description</label>
                                    </div>
                                    <textarea id="productDescription" class="textarea textarea-info grow rounded-none"
                                              placeholder="Product description" name="productDescription"></textarea>
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
                                <img id="p-img" src=""/>
                            </div>
                        </div>
                        <div x-data>
                            <button class="btn btn-primary btn-outline btn-sm w-24" @click="openFilePicker">
                                Change
                            </button>
                            <input x-ref="filePicker" type="file" class="hidden" accept=".jpg,.png,.jpeg"/>
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
        function openFilePicker() {
            this.$refs.filePicker.click();
        }

        const fileInput = document.querySelector('input[type="file"]');
        let base64String;
        fileInput.addEventListener('change', (e) => {
            const file = e.target.files[0];
            const reader = new FileReader();
            reader.onload = (e) => {
                base64String = e.target.result;
                const img = document.getElementById('p-img');
                img.src = base64String;
            }
            reader.readAsDataURL(file);
        });

        function getProductName() {
            return document.getElementById('productName').value;
        }

        function getProductPrice() {
            return document.getElementById('productPrice').value;
        }

        function getProductDescription() {
            return document.getElementById('productDescription').value;
        }

        function getWhichCategory() {
            const categorySelect = document.getElementById('whichCategory');
            if (categorySelect) {
                const selectedOption = categorySelect.options[categorySelect.selectedIndex];
                return selectedOption.value;
            }
        }

        function getProductImage() {
            return base64String;
        }

        function checkAllInput() {
            if (getProductName() == "" || getProductPrice() == ""
                || getProductDescription() == "" || getWhichCategory() == ""
                || getProductImage() == "") {
                return false;
            } else {
                return true;
            }
        }

        function createProduct() {
            if (checkAllInput()) {
                htmx.ajax('POST', '${pageContext.request.contextPath}/products-management/submit-create', {
                    swap: 'none', values: {
                        productName: getProductName(),
                        productPrice: getProductPrice(),
                        productDescription: getProductDescription(),
                        whichCategory: getWhichCategory(),
                        productImage: getProductImage()
                    }
                })
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Data missing!',
                    text: 'You must fill in all the fields.',
                    footer: '<a href="https://www.un.org/en/contact-us-0" target="_blank">Why i meet this error?</a>'
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
                            footer: '<a href="">Back to user management page</a>'
                        })
                        break;
                    case "error":
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Something went wrong!',
                            footer: '<a href="">Why do I have this issue?</a>'
                        })
                        break;
                    default:
                        alert("Error");
                        break;
                }
            });
        });
    </script>
</div>
</body>

</html>