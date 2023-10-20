<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache"); %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" data-theme="light">
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
    <title>After login page</title>
  </head>

  <body>
    <!-- navbar -->
    <%@include file="Webpage-components/navbar.jsp" %>
    <!-- main content -->
    <main class="container mx-auto pt-[50px]">
      <!-- Banner container -->
      <div
        class="w-full grid grid-cols-12 grid-rows-2 max-h-[32rem] gap-x-3 gap-y-2"
      >
        <!-- Carousel -->
        <div class="col-span-8 row-span-2 w-full h-full">
          <div class="carousel w-full h-full rounded-lg overflow-hidden">
            <div id="item1" class="carousel-item w-full">
              <img
                src="./asset/images/Homepage/Carousel/carousel_1.jpg"
                class="object-cover self-center"
              />
            </div>
            <div id="item2" class="carousel-item w-full">
              <img
                src="./asset/images/Homepage/Carousel/carousel_2.jpg"
                class="object-cover self-center"
              />
            </div>
            <div id="item3" class="carousel-item w-full">
              <img
                src="./asset/images/Homepage/Carousel/carousel_3.jpg"
                class="object-cover self-center"
              />
            </div>
            <div id="item4" class="carousel-item w-full">
              <img
                src="./asset/images/Homepage/Carousel/carousel_4.jpg"
                class="object-cover self-center"
              />
            </div>
          </div>
          <div class="flex justify-center w-full py-2 gap-2 mx-auto">
            <a href="#item1" class="btn btn-xs">1</a>
            <a href="#item2" class="btn btn-xs">2</a>
            <a href="#item3" class="btn btn-xs">3</a>
            <a href="#item4" class="btn btn-xs">4</a>
          </div>
        </div>

        <!-- Navigation cards -->
        <div
          class="card rounded-lg w-full h-full bg-base-100 shadow-xl image-full col-start-9 col-span-full z-0"
        >
          <figure>
            <img
              src="/images/stock/photo-1606107557195-0e29a4b5b4aa.jpg"
              alt="Shoes"
            />
          </figure>
          <div class="card-body">
            <h2 class="card-title">Finding your products?</h2>
            <p>We're here to help u!</p>
            <div class="card-actions justify-end">
              <form action="home" method="get">
                <button
                  class="btn btn-primary"
                  type="submit"
                  name="btAction"
                  value="product-list-site"
                >
                  Shop Now
                </button>
              </form>
            </div>
          </div>
        </div>
        <!-- Navigation cards 2  -->
        <div
          class="card w-full h-full bg-base-100 shadow-xl image-full col-start-9 col-span-full z-0"
        >
          <figure>
            <img
              src="/images/stock/photo-1606107557195-0e29a4b5b4aa.jpg"
              alt="Shoes"
            />
          </figure>
          <div class="card-body">
            <h2 class="card-title">Shoes!</h2>
            <p>If a dog chews shoes whose shoes does he choose?</p>
            <div class="card-actions justify-end">
              <button class="btn btn-primary">Buy Now</button>
            </div>
          </div>
        </div>
      </div>

      <!-- Categories -->
      <div class="w-full mt-24">
        <div
          class="justify-center text-white text-center text-xl self-stretch bg-slate-700 py-3 rounded-t-lg rounded-b-none max-md:max-w-full max-md:pl-2.5"
        >
          CATEGORIES
        </div>
        <div
          class="bg-slate-200 self-center flex min-w-full flex-col p-6 rounded-lg max-md:max-w-full"
        >
          <!-- Category carousel -->
          <div class="category-carousel">
            <ul class="flex flex-wrap z-10 gap-2">
              <c:forEach items="${allCategories}" var="category">
                <li class="w-28 h-32">
                  <a
                    href="#"
                    class="category-item block h-full"
                    title="${category.categoryName}"
                  >
                    <div class="flex flex-col items-center h-full">
                      <div
                        class="min-h-[70%] w-3/4 flex flex-col items-center justify-center"
                      >
                        <div class="avatar">
                          <div class="w-14 rounded-full">
                            <img
                              src="${category.categoryImage}"
                              alt="Category-img"
                            />
                          </div>
                        </div>
                      </div>
                      <div
                        class="flex justify-center flex-grow items-center text-xs w-full"
                      >
                        <p class="truncate w-full text-center">
                          ${category.categoryName}
                        </p>
                      </div>
                    </div>
                  </a>
                </li>
              </c:forEach>
            </ul>
          </div>
        </div>
      </div>
    </main>

    <!-- footer -->
    <%@include file="Webpage-components/footer.jsp" %>
  </body>
</html>
