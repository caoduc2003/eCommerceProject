<%-- Created by IntelliJ IDEA. User: brian Date: 10/12/2023 Time: 3:55 PM To
change this template use File | Settings | File Templates. --%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" data-theme="light">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
    <script
      src="https://unpkg.com/htmx.org@1.9.6"
      integrity="sha384-FhXw7b6AlE/jyjlZH5iHa/tTe9EpJ1Y55RjcgPbjeWMskSxZt1v9qkxLJWNJaGni"
      crossorigin="anonymous"
    ></script>

    <title>Profile</title>
  </head>
  <body>
    <%@include file="Webpage-components/navbar.jsp"%>
    <div class="flex gap-7 container mx-auto">
      <div class="h-[80vh] w-60 bg-blue-400 flex flex-col rounded-lg">
        <div class="w-full h-12 flex justify-start items-center">
          <p class="pl-4 text-xl">Hello, Username</p>
        </div>
        <div>
          <ul class="menu bg-blue-400 w-full p-0 [&_li>*]:rounded-none">
            <li><a>Profile</a></li>
            <li><a>User management</a></li>
            <li><a>Your order</a></li>
            <li><a>Products</a></li>
            <li><a>Categories</a></li>
          </ul>
        </div>
      </div>

      <div class="grow">
        <div>
          <h2 class="text-2xl font-bold">Profile</h2>
          <p class="text-base font-thin">
            Manage profile information for account security
          </p>
        </div>
        <div class="divider"></div>
        <div class="w-full">
          <form action="">
            <div class="w-full">
              <div class="flex">
                <div class="w-"></div>
                <label for="username" class="label">Username</label>
                  <input
                    type="text"
                    id="username"
                    name="username"
                    class="input input-bordered"
                    placeholder="Username"
                  />
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>

    <%@include file="Webpage-components/footer.jsp"%>
  </body>
</html>
