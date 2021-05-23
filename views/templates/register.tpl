{extends file="inc/theme.tpl"}
{$title = "registro de cuenta"}
{block name=content}
        <div class="sm:max-w-sm mx-auto">
            <div class="max-w-sm py-4">
                <h1 class="text-3xl text-center">Registra tu cuenta</h1>
            </div>
            <div class="bg-white py-8 px-4 shadow sm:rounded-md sm:px-10">
                <form class="space-y-6" action="/registro" method="POST">
                    <div>
                        <label for="nombre" class="block text-sm font-medium text-gray-700">Nombre</label>
                        <div class="mt-1">
                            <input type="text" id="nombre" name="nombre" autocomplete="nombre" required class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-sm shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                        </div>
                    </div>
                    <div>
                        <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                        <div class="mt-1">
                            <input type="email" id="email" name="email" autocomplete="email" required class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-sm shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                        </div>
                    </div>
                    <div>
                        <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                        <div class="mt-1">
                            <input type="password" id="password" name="password" autocomplete="password" required class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-sm shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                        </div>
                    </div>
                    <div>
                        <button type="submit" class="w-full flex justify-center py-2 px-4 border rounded-sm shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                            Registrarse
                        </button>
                    </div>
                </form>
            </div>
        </div>
{/block}