<%-- Created by IntelliJ IDEA. User: brian Date: 10/20/2023 Time: 4:24 PM To
change this template use File | Settings | File Templates. --%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html data-theme="light">
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
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
    <title>Signup</title>
  </head>
  <body class="w-screen h-screen flex justify-center items-center">
    <div class="card w-full max-w-sm shadow-2xl bg-base-100">
      <div class="card-body">
        <div class="flex justify-center items-center pb-3">
            <div class="card-title ">Sign up your Buylicious</div>
        </div>
        <form action="login" method="POST">
          <div class="form-control">
            <label class="label">
              <span class="label-text">Email</span>
            </label>
            <input
              type="text"
              placeholder="email"
              class="input input-bordered"
              name="txtEmail"
            />
          </div>
          <div class="form-control">
            <label class="label">
              <span class="label-text">Name</span>
            </label>
            <input
              type="text"
              placeholder="email"
              class="input input-bordered"
              name="txtEmail"
            />
          </div>
          <div class="form-control">
            <label class="label">
              <span class="label-text">Password</span>
            </label>
            <input
              type="text"
              placeholder="email"
              class="input input-bordered"
              name="txtEmail"
            />
          </div>
          <div class="form-control">
            <label class="label">
              <span class="label-text">Confirm password</span>
            </label>
            <input
              type="text"
              placeholder="password"
              class="input input-bordered"
              name="txtPassword"
            />
          </div>
          <div class="form-control mt-6">
            <button
              class="btn btn-primary btn-outline"
              type="submit"
              name="btAction"
              value="Login"
            >
              Signup
            </button>
          </div>
          <div class="text-center mt-5">
            Already have an account?
            <a href="#" class="link link-hover text-blue-600">Sign in</a>
          </div>
        </form>
      </div>
    </div>
  </body>
</html>
