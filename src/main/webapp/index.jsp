<% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); response.setHeader("Pragma","no-cache");%>
    <% if(request.getSession().getAttribute("fullName")==null){ response.sendRedirect("login"); } %>
        <% String name=(String) session.getAttribute("fullName"); %>
            <!DOCTYPE html>
            <html lang="en" data-theme="light">

            <head>
                <meta charset="UTF-8" />
                <meta content="width=device-width, initial-scale=1.0" name="viewport" />
                <link href="https://cdn.jsdelivr.net/npm/daisyui@3.8.1/dist/full.css" rel="stylesheet"
                    type="text/css" />
                <link rel="icon"
                    href="https://www.google.com/url?sa=i&url=https%3A%2F%2F1000logos.net%2Funited-nations-logo%2F&psig=AOvVaw0JdZBkcrMjrG2_qj39mIIB&ust=1696527753738000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCMj-gMP43IEDFQAAAAAdAAAAABAE" />
                <link rel="stylesheet" href="./styles.css">
                <script src="https://cdn.tailwindcss.com"></script>
                <style>
                    @import url('https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&display=swap');
                </style>
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
                <!-- navigation bar here -->
                <div class="navbar bg-base-100 justify-around z-10 fixed">
                    <div>
                        <a class="btn btn-ghost normal-case text-xl">Buylicious</a>
                    </div>
                    <!-- <input type="text" placeholder="Search here" class="input input-bordered xl:w-7/12 md:w-1/2" /> -->
                    <div class="join xl:w-7/12 md:w-1/2">
                        <div class="w-full">
                            <div class="w-full">
                                <input class="input input-bordered join-item w-full rounded-lg"
                                    placeholder="Search for products" />
                            </div>
                        </div>
                        <select class="select select-bordered join-item">
                            <option disabled selected>Filter</option>
                            <option>Sci-fi</option>
                            <option>Drama</option>
                            <option>Action</option>
                        </select>
                        <div class="indicator">
                            <button class="btn join-item">Search</button>
                        </div>
                    </div>
                    <div class="flex flex-end">
                        <div class="dropdown dropdown-end">
                            <label tabindex="0" class="btn btn-ghost btn-circle">
                                <div class="indicator">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none"
                                        viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z">
                                        </path>
                                    </svg>
                                    <span class="badge badge-sm indicator-item">8</span>
                                </div>
                            </label>
                            <div tabindex="0"
                                class="mt-3 z-[1] card card-compact dropdown-content w-52 bg-base-100 shadow">
                                <div class="card-body">
                                    <span class="font-bold text-lg">8 Items</span>
                                    <span class="text-info">Subtotal: $999</span>
                                    <div class="card-actions">
                                        <button class="btn btn-primary btn-block">View cart</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="dropdown dropdown-end">
                            <label tabindex="0" class="btn btn-ghost btn-circle avatar">
                                <div class="w-10 rounded-full">
                                    <img src="" />
                                </div>
                            </label>
                            <ul tabindex="0"
                                class="menu menu-sm dropdown-content mt-3 z-[1] p-2 shadow bg-base-100 rounded-box w-52">
                                <li>
                                    <a class="justify-between">
                                        Profile
                                        <span class="badge">New</span>
                                    </a>
                                </li>
                                <li><a>Settings</a></li>
                                <li><a>Logout</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- main content -->
                <main class="container mx-auto pt-20">

                    <!-- Banner container -->
                    <div class="w-full grid grid-cols-12 grid-rows-2 max-h-[32rem] gap-x-3 gap-y-2">
                        <!-- Carousel -->
                        <div class="col-span-8 row-span-2 w-full h-full">
                            <div class="carousel w-full h-full rounded-lg overflow-hidden">
                                <div id="item1" class="carousel-item w-full">
                                    <img src="./asset/images/Homepage/Carousel/carousel_1.jpg"
                                        class="object-cover self-center" />
                                </div>
                                <div id="item2" class="carousel-item w-full">
                                    <img src="./asset/images/Homepage/Carousel/carousel_2.jpg"
                                        class="object-cover self-center" />
                                </div>
                                <div id="item3" class="carousel-item w-full">
                                    <img src="./asset/images/Homepage/Carousel/carousel_3.jpg"
                                        class="object-cover self-center" />
                                </div>
                                <div id="item4" class="carousel-item w-full">
                                    <img src="./asset/images/Homepage/Carousel/carousel_4.jpg"
                                        class="object-cover self-center" />
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
                        <div class="card w-full h-full bg-base-100 shadow-xl image-full col-start-9 col-span-full z-0">
                            <figure><img src="/images/stock/photo-1606107557195-0e29a4b5b4aa.jpg" alt="Shoes" /></figure>
                            <div class="card-body">
                              <h2 class="card-title">Shoes!</h2>
                              <p>If a dog chews shoes whose shoes does he choose?</p>
                              <div class="card-actions justify-end">
                                <button class="btn btn-primary">Buy Now</button>
                              </div>
                            </div>
                          </div>
                          <!-- Navigation cards 2  -->
                          <div class="card w-full h-full bg-base-100 shadow-xl image-full col-start-9 col-span-full z-0">
                            <figure><img src="/images/stock/photo-1606107557195-0e29a4b5b4aa.jpg" alt="Shoes" /></figure>
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
                    <div
                        class="bg-slate-200 self-center flex min-w-full flex-col mt-24 pb-10 rounded-lg max-md:max-w-full">
                        <div
                            class="justify-center text-white text-center text-xl self-stretch bg-slate-700 py-3 rounded-t-lg rounded-b-none max-md:max-w-full max-md:pl-2.5">
                            CATEGORIES
                        </div>

                        <!-- Category carousel -->
                        <div class="category-carousel">
                            <ul class="flex flex-wrap z-10">
                                <li class="w-24 h-28">
                                    <a href="#" class="category-item">
                                        <div class="flex flex-col items-center w-24 h-28">
                                            <div class="h-3/4 w-3/4 flex flex-col items-center justify-center">
                                                <div class="avatar">
                                                    <div class="w-14 rounded-full">
                                                        <img src="./asset/images/Homepage/Carousel/js lol alpha gaming.png"
                                                            alt="Category-img">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="w-full flex justify-center h-1/4">
                                                <div>Category_1</div>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>

                    </div>
                </main>

                <!-- footer -->
                <footer class="footer footer-center p-10 bg-primary text-primary-content rounded-t-lg mt-24">
                    <aside>
                        <svg width="50" height="50" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"
                            fill-rule="evenodd" clip-rule="evenodd" class="inline-block fill-current">
                            <path
                                d="M22.672 15.226l-2.432.811.841 2.515c.33 1.019-.209 2.127-1.23 2.456-1.15.325-2.148-.321-2.463-1.226l-.84-2.518-5.013 1.677.84 2.517c.391 1.203-.434 2.542-1.831 2.542-.88 0-1.601-.564-1.86-1.314l-.842-2.516-2.431.809c-1.135.328-2.145-.317-2.463-1.229-.329-1.018.211-2.127 1.231-2.456l2.432-.809-1.621-4.823-2.432.808c-1.355.384-2.558-.59-2.558-1.839 0-.817.509-1.582 1.327-1.846l2.433-.809-.842-2.515c-.33-1.02.211-2.129 1.232-2.458 1.02-.329 2.13.209 2.461 1.229l.842 2.515 5.011-1.677-.839-2.517c-.403-1.238.484-2.553 1.843-2.553.819 0 1.585.509 1.85 1.326l.841 2.517 2.431-.81c1.02-.33 2.131.211 2.461 1.229.332 1.018-.21 2.126-1.23 2.456l-2.433.809 1.622 4.823 2.433-.809c1.242-.401 2.557.484 2.557 1.838 0 .819-.51 1.583-1.328 1.847m-8.992-6.428l-5.01 1.675 1.619 4.828 5.011-1.674-1.62-4.829z">
                            </path>
                        </svg>
                        <p class="font-bold">
                            ACME Industries Ltd. <br />Providing reliable tech since 1992
                        </p>
                        <p>Copyright © 2023 - All right reserved</p>
                    </aside>
                    <nav>
                        <div class="grid grid-flow-col gap-4">
                            <a><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    class="fill-current">
                                    <path
                                        d="M24 4.557c-.883.392-1.832.656-2.828.775 1.017-.609 1.798-1.574 2.165-2.724-.951.564-2.005.974-3.127 1.195-.897-.957-2.178-1.555-3.594-1.555-3.179 0-5.515 2.966-4.797 6.045-4.091-.205-7.719-2.165-10.148-5.144-1.29 2.213-.669 5.108 1.523 6.574-.806-.026-1.566-.247-2.229-.616-.054 2.281 1.581 4.415 3.949 4.89-.693.188-1.452.232-2.224.084.626 1.956 2.444 3.379 4.6 3.419-2.07 1.623-4.678 2.348-7.29 2.04 2.179 1.397 4.768 2.212 7.548 2.212 9.142 0 14.307-7.721 13.995-14.646.962-.695 1.797-1.562 2.457-2.549z">
                                    </path>
                                </svg></a>
                            <a><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    class="fill-current">
                                    <path
                                        d="M19.615 3.184c-3.604-.246-11.631-.245-15.23 0-3.897.266-4.356 2.62-4.385 8.816.029 6.185.484 8.549 4.385 8.816 3.6.245 11.626.246 15.23 0 3.897-.266 4.356-2.62 4.385-8.816-.029-6.185-.484-8.549-4.385-8.816zm-10.615 12.816v-8l8 3.993-8 4.007z">
                                    </path>
                                </svg></a>
                            <a><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    class="fill-current">
                                    <path
                                        d="M9 8h-3v4h3v12h5v-12h3.642l.358-4h-4v-1.667c0-.955.192-1.333 1.115-1.333h2.885v-5h-3.808c-3.596 0-5.192 1.583-5.192 4.615v3.385z">
                                    </path>
                                </svg></a>
                        </div>
                    </nav>
                </footer>
            </body>

            </html>