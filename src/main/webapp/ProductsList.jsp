<!DOCTYPE html>
<html lang="en" data-theme="light">
<head>
    <meta charset="UTF-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
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
                class="category-sidebar rounded-xl h-[500px] bg-base-200 shadow-lg"
        >
            <div
                    class="sidebar-header w-full h-[50px] flex items-center justify-center"
            >
                <span class="mr-2"><i class="fa-solid fa-filter"></i></span>
                <div class="text-base font-semibold uppercase text-center">Search filter</div>
            </div>
            <div class="category-items">
                <!-- <div>
                    <div class="ml-2">By Category</div>
                </div> -->
                <div>
                    <ul class="menu bg-base-200 w-56 rounded-box">
                        <li>
                            <h2 class="menu-title">By Categories</h2>
                            <ul>
                                <li><a>Item 1</a></li>
                                <li><a>Item 2</a></li>
                                <li><a>Item 3</a></li>
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
                    <a href="#" class="group">
                        <div
                                class="aspect-h-1 aspect-w-1 w-full overflow-hidden rounded-lg bg-gray-200 xl:aspect-h-8 xl:aspect-w-7"
                        >
                            <img
                                    src="https://tailwindui.com/img/ecommerce-images/category-page-04-image-card-01.jpg"
                                    alt="Tall slender porcelain bottle with natural clay textured body and cork stopper."
                                    class="h-full w-full object-cover object-center group-hover:opacity-75"
                            />
                        </div>
                        <h3 class="mt-4 text-sm text-gray-700">Earthen Bottle</h3>
                        <p class="mt-1 text-lg font-medium text-gray-900">$48</p>
                    </a>
                    <a href="#" class="group">
                        <div
                                class="aspect-h-1 aspect-w-1 w-full overflow-hidden rounded-lg bg-gray-200 xl:aspect-h-8 xl:aspect-w-7"
                        >
                            <img
                                    src="https://tailwindui.com/img/ecommerce-images/category-page-04-image-card-02.jpg"
                                    alt="Olive drab green insulated bottle with flared screw lid and flat top."
                                    class="h-full w-full object-cover object-center group-hover:opacity-75"
                            />
                        </div>
                        <h3 class="mt-4 text-sm text-gray-700">Nomad Tumbler</h3>
                        <p class="mt-1 text-lg font-medium text-gray-900">$35</p>
                    </a>
                    <a href="#" class="group">
                        <div
                                class="aspect-h-1 aspect-w-1 w-full overflow-hidden rounded-lg bg-gray-200 xl:aspect-h-8 xl:aspect-w-7"
                        >
                            <img
                                    src="https://tailwindui.com/img/ecommerce-images/category-page-04-image-card-03.jpg"
                                    alt="Person using a pen to cross a task off a productivity paper card."
                                    class="h-full w-full object-cover object-center group-hover:opacity-75"
                            />
                        </div>
                        <h3 class="mt-4 text-sm text-gray-700">Focus Paper Refill</h3>
                        <p class="mt-1 text-lg font-medium text-gray-900">$89</p>
                    </a>
                    <a href="#" class="group">
                        <div
                                class="aspect-h-1 aspect-w-1 w-full overflow-hidden rounded-lg bg-gray-200 xl:aspect-h-8 xl:aspect-w-7"
                        >
                            <img
                                    src="https://tailwindui.com/img/ecommerce-images/category-page-04-image-card-04.jpg"
                                    alt="Hand holding black machined steel mechanical pencil with brass tip and top."
                                    class="h-full w-full object-cover object-center group-hover:opacity-75"
                            />
                        </div>
                        <h3 class="mt-4 text-sm text-gray-700">
                            Machined Mechanical Pencil
                        </h3>
                        <p class="mt-1 text-lg font-medium text-gray-900">$35</p>
                    </a>

                    <!-- More products... -->
                </div>
            </div>
        </div>
    </div>
</main>
<%@include file="Webpage-components/footer.jsp" %>
</body>
</html>
