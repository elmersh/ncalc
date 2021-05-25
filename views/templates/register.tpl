{extends file="inc/theme.tpl"}
{$title = "registro de cuenta"}
{$buttons = false}
{$active = 'crear-cuenta'}
{block name=content}
    <div class="sm:max-w-sm mx-auto">

        <div class="flex flex-col justify-center">
          <div class="w-full">
            <h1 class="mt-6 text-center text-3xl font-extrabold text-gray-900">
                Registra tu cuenta</h1>
                <p class="mt-2 text-center text-sm text-gray-600 max-w">
                  o
                  <a href="/ingresar" class="font-medium text-green-600 hover:text-green-500">
                    ingresa a tu cuenta
                  </a>
                </p>
            </div>
            {if isset($errors)}
            <ul class="mt-8">
                {foreach $errors as $error}
                    <li>{$error}</li>
                {/foreach}
            </ul>
            {/if}
            <div class="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
                <div class="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
                <form class="space-y-6" action="/crear-cuenta" method="POST">
                    <div>
                        <label for="nombre" class="block text-sm font-medium text-gray-700">Nombre</label>
                        <div class="mt-1">
                            <input value="{if isset($smarty.post.nombre)}{$smarty.post.nombre}{/if}" type="text" id="nombre" name="nombre" autocomplete="nombre" required class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-sm shadow-sm placeholder-gray-400 focus:outline-none focus:ring-green-500 focus:border-green-500 sm:text-sm">
                        </div>
                    </div>
                    <div>
                        <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                        <div class="mt-1">
                            <input value="{if isset($smarty.post.email)}{$smarty.post.email}{/if}" type="email" id="email" name="email" autocomplete="email" required class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-sm shadow-sm placeholder-gray-400 focus:outline-none focus:ring-green-500 focus:border-green-500 sm:text-sm">
                        </div>
                    </div>
                    <div>
                        <label for="clave" class="block text-sm font-medium text-gray-700">Password</label>
                        <div class="mt-1">
                            <input type="password" id="clave" name="clave" autocomplete="clave" required class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-sm shadow-sm placeholder-gray-400 focus:outline-none focus:ring-green-500 focus:border-green-500 sm:text-sm">
                        </div>
                    </div>
                    <div>
                        <button type="submit" name="submit" class="w-full flex justify-center py-2 px-4 border rounded-sm shadow-sm text-sm font-medium text-white bg-green-600 hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500">
                            Registrarse
                        </button>
                    </div>
                </form>
                </div>
            </div>
        </div>
{/block}