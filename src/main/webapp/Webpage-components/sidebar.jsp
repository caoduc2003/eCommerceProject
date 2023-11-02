<div class="h-screen w-64 bg-base-100 flex flex-col rounded-none fixed left-0 top-0 text-base border">
    <div class="w-full h-12 flex justify-start items-center">
        <p class="pl-4 text-xl">Hello, Username</p>
    </div>
    <div>
        <ul class="menu w-full p-0 [&_li>*]:rounded-none">
            <li><a href="${pageContext.request.contextPath}/account">Profile</a></li>
            <li><a href="${pageContext.request.contextPath}/order">Your order</a></li>
            <li>
                <a id="admin-btn" class="menu-dropdown-toggle menu-dropdown-show">Admin zone</a>
                <ul id="admin-cate" class="menu-dropdown menu-dropdown-show">
                    <li><a href="${pageContext.request.contextPath}/user-management">Users</a></li>
                    <li><a href="${pageContext.request.contextPath}/products-management">Products</a></li>
                    <li><a href="${pageContext.request.contextPath}/cartegories-management">Categories</a></li>
                    <li><a href="${pageContext.request.contextPath}/transport-unit-management">Transport Unit</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>

<script>
    const adminBtn = document.getElementById("admin-btn");
    const adminCate = document.getElementById("admin-cate");

    adminBtn.addEventListener("click", () => {
        adminBtn.classList.toggle("menu-dropdown-show");
        adminCate.classList.toggle("menu-dropdown-show");
    });
</script>