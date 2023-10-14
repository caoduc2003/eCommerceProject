<%-- Created by IntelliJ IDEA. User: brian Date: 10/12/2023 Time: 3:56 PM To
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
    <title>Checkout</title>
  </head>
  <body>
    <%@ include file="Webpage-components/navbar.jsp"%>
    <main class="container mx-auto">
      <!-- Breadcrumb -->
      <div class="pt-4">
        <div class="text-base breadcrumbs">
          <ul>
            <li><a>Home</a></li>
            <li><a>Documents</a></li>
            <li><a>Cart</a></li>
            <li class="text-slate-500">Checkout</li>
          </ul>
        </div>
      </div>

      <!-- Checkout section -->
      <div class="mt-4">
        <div class="grid grid-cols-[55%_minmax(30%,_1fr)]">
          <!-- Left side -->
          <div class="w-full h-full">
            <div>
              <h1 class="text-2xl font-bold">Checkout</h1>
            </div>

            <div class="divider"></div>

            <div>
              <h2 class="text-base font-semibold">Shipping info</h2>
            </div>

            <div class="name-section flex items-center gap-4 mt-7">
              <div class="form-control w-full">
                <label class="label">
                  <span class="label-text">Firstname</span>
                </label>
                <input
                  type="text"
                  placeholder="Firstname"
                  class="input input-bordered w-full"
                />
              </div>

              <div class="form-control w-full">
                <label class="label">
                  <span class="label-text">Lastname</span>
                </label>
                <input
                  type="text"
                  placeholder="Lastname"
                  class="input input-bordered w-full"
                />
              </div>
            </div>

            <div class="contact-section flex gap-4">
              <div class="form-control w-full min-w-[65%]">
                <label class="label">
                  <span class="label-text">Email</span>
                </label>
                <input
                  type="text"
                  placeholder="Email"
                  class="input input-bordered w-full"
                />
              </div>

              <!-- copy this block for easy styling! -->
              <div class="form-control w-full">
                <label class="label">
                  <span class="label-text">Phone</span>
                </label>
                <input
                  type="text"
                  placeholder="Phone number"
                  class="input input-bordered w-full"
                />
              </div>
            </div>

            <div class="address-section">
              <div class="form-control w-full">
                <label class="label">
                  <span class="label-text">Address</span>
                </label>
                <input
                  type="text"
                  placeholder="Address"
                  class="input input-bordered w-full"
                />
              </div>

              <div class="flex gap-4">
                <div class="form-control w-1/3">
                  <label class="label">
                    <span class="label-text">Country</span>
                  </label>
                  <input
                    type="text"
                    placeholder="Country"
                    class="input input-bordered w-full"
                  />
                </div>
                <div class="form-control w-1/3">
                  <label class="label">
                    <span class="label-text">City</span>
                  </label>
                  <input
                    type="text"
                    placeholder="City"
                    class="input input-bordered w-full"
                  />
                </div>
                <div class="form-control w-1/3">
                  <label class="label">
                    <span class="label-text">District</span>
                  </label>
                  <input
                    type="text"
                    placeholder="District"
                    class="input input-bordered w-full"
                  />
                </div>
              </div>

            <div class="flex gap-32 mt-6">
              <div class="form-control w-fit">
                <label class="label cursor-pointer gap-x-2">
                  <input type="checkbox" checked="checked" class="checkbox checkbox-primary checkbox-xs" />
                  <span class="label-text">Save this address to your address list</span>
                </label>
              </div>
              <div class="form-control w-fit">
                <label class="label cursor-pointer gap-x-2">
                  <input type="checkbox" checked="checked" class="checkbox checkbox-primary checkbox-xs" />
                  <span class="label-text">Use this address as default</span>
                </label>
              </div>
            </div>
            </div>

            <div class="divider"></div>

            <!-- SHIPPING METHOD -->
            <div>
              <h2 class="text-base font-semibold">Shipping method</h2>
            </div>

            <div class="Shipping-method flex gap-4 pt-7">
              <div class="card w-1/2 bg-base-200 card-bordered border-black">
                <div class="card-actions absolute right-4 top-5">
                  <input type="radio" name="Shipping-type" class="radio radio-primary" checked />
                </div>
                <div class="card-body">
                  <h2 class="card-title">Standard</h2>
                  <p>From 4-5 bussiness days</p>
                  <p>Shipping unit: GHTK</p>
                  <h2 class="font-thin">23,000đ</h2>
                </div>
              </div>

              <div class="card w-1/2 bg-base-200 card-bordered border-black">
                <div class="card-actions absolute right-4 top-5">
                  <input type="radio" name="Shipping-type" class="radio radio-primary" checked />
                </div>
                <div class="card-body">
                  <h2 class="card-title">Express</h2>
                  <p>From 2-3 bussiness days</p>
                  <p>Shipping unit: SPX</p>
                  <h2 class="font-thin">29,000đ</h2>
                </div>
              </div>
            </div>

            <div class="divider"></div>
            <!-- PAYMENT INFO -->
            <div>
              <h2 class="text-base font-semibold">Payment info</h2>
            </div>

          </div>
        </div>
      </div>
    </main>
    <%@ include file="Webpage-components/footer.jsp"%>
  </body>
</html>
