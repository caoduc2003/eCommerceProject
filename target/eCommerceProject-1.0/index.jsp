<%
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
    response.setHeader("Pragma","no-cache");
%>
    <!DOCTYPE html>
    <html lang="en" data-theme="cupcake">

    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <link href="https://cdn.jsdelivr.net/npm/daisyui@3.8.1/dist/full.css" rel="stylesheet" type="text/css" />
        <link rel="icon"
            href="https://www.google.com/url?sa=i&url=https%3A%2F%2F1000logos.net%2Funited-nations-logo%2F&psig=AOvVaw0JdZBkcrMjrG2_qj39mIIB&ust=1696527753738000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCMj-gMP43IEDFQAAAAAdAAAAABAE">
        <script src="https://cdn.tailwindcss.com"></script>
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
            }
        </script>
        <title>After login page</title>
    </head>

    <body>

        <!-- navigation bar here -->
        <div class="navbar bg-base-100 justify-around fixed z-10">
            <div>
                <a class="btn btn-ghost normal-case text-xl">Webbanhang.com</a>
            </div>
            <!-- <input type="text" placeholder="Search here" class="input input-bordered xl:w-7/12 md:w-1/2" /> -->
            <div class="join xl:w-7/12 md:w-1/2">
                <div class="w-full">
                    <div class="w-full">
                        <input class="input input-bordered join-item w-full rounded-lg" placeholder="ASUS RTX 3060Ti" />
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
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
                            </svg>
                            <span class="badge badge-sm indicator-item">8</span>
                        </div>
                    </label>
                    <div tabindex="0" class="mt-3 z-[1] card card-compact dropdown-content w-52 bg-base-100 shadow">
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
                            <img src="https://support.google.com/nonprofits/answer/1614581?hl=vi" />
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
        <div class="w-44 h-96 bg-white rounded-lg shadow border border-black relative z-0 top-60"></div>

    </body>

    </html>