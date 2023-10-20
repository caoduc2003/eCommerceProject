<%-- Created by IntelliJ IDEA. User: brian Date: 10/20/2023 Time: 3:49 PM To
change this template use File | Settings | File Templates. --%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" data-theme="light">
  <head>
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
    <title>UserMan.</title>
  </head>
  <body>
    <div class="overflow-x-auto">
      <table class="table">
        <!-- head -->
        <thead>
          <tr>
            <th></th>
            <th>Account Name</th>
            <th>Email</th>
            <th>Date Created</th>
            <th>Role</th>
            <th>Status</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <!-- row 1 -->
          <tr>
            <th>
              <label>
                <input type="checkbox" class="checkbox" />
              </label>
            </th>
            <td>
              <div class="flex items-center space-x-3">
                <div class="avatar">
                  <div class="mask mask-squircle w-12 h-12">
                    <img
                      src="/tailwind-css-component-profile-2@56w.png"
                      alt="Avatar Tailwind CSS Component"
                    />
                  </div>
                </div>
                <div>
                  <div class="font-bold">Duc Lai Dinh Cao</div>
                </div>
              </div>
            </td>
            <td>
              ducldc@jsclub.dev
              <br />
              <span class="badge badge-ghost badge-sm">0373392840</span>
            </td>
            <td>2023-10-11</td>
            <td>Admin</td>
            <td>Active</td>
          </tr>
          <!-- row 2 -->
          <tr>
            <th>
              <label>
                <input type="checkbox" class="checkbox" />
              </label>
            </th>
            <td>
              <div class="flex items-center space-x-3">
                <div class="avatar">
                  <div class="mask mask-squircle w-12 h-12">
                    <img
                      src="/tailwind-css-component-profile-2@56w.png"
                      alt="Avatar Tailwind CSS Component"
                    />
                  </div>
                </div>
                <div>
                  <div class="font-bold">Duc Lai Dinh Cao</div>
                </div>
              </div>
            </td>
            <td>
              ducldc@jsclub.dev
              <br />
              <span class="badge badge-ghost badge-sm">0373392840</span>
            </td>
            <td>2023-10-11</td>
            <td>Admin</td>
            <td>Active</td>
          </tr>
        </tbody>
      </table>
    </div>
  </body>
</html>
