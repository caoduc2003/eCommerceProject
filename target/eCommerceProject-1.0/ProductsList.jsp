<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page
contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en" data-theme="light" class="scroll-smooth">
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
    <script
      src="https://unpkg.com/htmx.org@1.9.6"
      integrity="sha384-FhXw7b6AlE/jyjlZH5iHa/tTe9EpJ1Y55RjcgPbjeWMskSxZt1v9qkxLJWNJaGni"
      crossorigin="anonymous"
    ></script>
    <script>
      module.exports = {
        //...

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

        //...
      };
    </script>
    <title>Products</title>
  </head>

  <body>
    <!-- navbar -->
    <%@ include file="Webpage-components/navbar.jsp" %>

    <!-- main content -->
    <main class="container mt-5 mx-auto">
      <div class="flex justify-between">
        <!-- filter bar -->
        <div
          class="category-sidebar rounded-xl max-h-[500px] bg-base-200 shadow-lg"
        >
          <div
            class="sidebar-header w-full h-[50px] flex items-center justify-center"
          >
            <span class="mr-2"><i class="fa-solid fa-filter"></i></span>
            <div class="text-base font-semibold uppercase text-center">
              Search filter
            </div>
          </div>
          <div class="category-items max-h-[450px] w-full">
            <h2 class="menu-title sticky">By Categories</h2>
            <div class="overflow-scroll overflow-x-hidden max-h-[400px]">
              <ul class="menu bg-base-200 w-56 rounded-box">
                <li>
                  <ul>
                    <c:forEach items="${allCategories}" var="category">
                      <li><a>${category.categoryName}</a></li>
                    </c:forEach>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="max-w-[70%]">
          <div class="mx-auto max-w-2xl px-4 sm:px-6 lg:max-w-7xl lg:px-8">
            <h2 class="sr-only">Products</h2>
            <div
              class="grid grid-cols-1 gap-x-6 gap-y-10 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 xl:gap-x-8"
            >
                <c:forEach items="${allProducts}" var="product">
                    <a href="product?id=${product.productID}" class="group">
                        <div
                                class="aspect-[1/1] w-full overflow-hidden rounded-lg bg-gray-200 xl:aspect-h-8 xl:aspect-w-7"
                        >
                            <img
                                    src="${product.productImage}"
                                    alt="lorem"
                                    class="h-full w-full object-scale-down object-center group-hover:opacity-75"
                            />
                        </div>
                        <h3 class="mt-4 text-sm text-gray-700">${product.productName}</h3>
                        <p class="mt-1 text-lg font-medium text-gray-900">
                            <fmt:setLocale value="vi_VN"/>
                            <fmt:formatNumber value="${product.productPrice}" type="currency" currencySymbol="đ" maxFractionDigits="0"/>
                        </p>
                    </a>
                </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </main>
    <%@include file="Webpage-components/footer.jsp" %>
  </body>
</html>
