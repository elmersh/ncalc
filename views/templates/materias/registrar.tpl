{extends file="inc/theme.tpl"}
{$title = "Registro de materia"}
{$buttons = true}
{$url = '/materias/registrar'}
{$btitle = 'Registrar materia'}

{$active = 'materia'}
{block name=content}
<div class="sm:max-w-xl mx-auto">


  <div class="mt-8 sm:mx-auto">
    <div class="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
<form action="/materias/registrar" method="post" class="space-y-8 divide-y divide-gray-200">

  <div class="space-y-8 divide-y divide-gray-200">
    <div>
      <div>
{if isset($errors)}
<ul class="mt-8">
    {foreach $errors as $error}
        <li>{$error}</li>
    {/foreach}
</ul>
{/if}
      <div class="mt-6 grid grid-cols-1 gap-y-6 gap-x-4 sm:grid-cols-6">
        <div class="sm:col-span-4">
          <label for="nombre" class="block text-sm font-medium text-gray-700">
            Nombre de materia
          </label>
          <div class="mt-1">
            <input type="text" name="nombre" id="nombre" value="{if isset($smarty.post.nombre) }{$smarty.post.nombre}{/if}" autocomplete="family-name" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md">
          </div>
        </div>

        <div class="sm:col-span-2">
          <label for="codigo" class="block text-sm font-medium text-gray-700">
            Codigo
          </label>
          <div class="mt-1">
            <input id="codigo" name="codigo" type="text" {if isset($smarty.post.codigo) }value='{$smarty.post.codigo}'{/if} autocomplete="codigo" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md">
          </div>
        </div>
        <div class="sm:col-span-6">
          <div class="mt-4 space-y-4">
            <div class="sm:col-span-4">
              <label for="horario" class="block text-sm font-medium text-gray-700">
                Horario <span class="text-xs text-gray-500">ejemplo: lun-vi 8:00am a 9:30am</span>
              </label>
              <div class="mt-1">
                <input type="text" name="horario" id="horario" value="{if isset($smarty.post.horario) }{$smarty.post.horario}{/if}" autocomplete="horario" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md">
              </div>
            </div>
          </div>
        </div>


      </div>
    </div>

  <div class="pt-5">
    <div class="flex justify-end">
      <button type="submit" name="submit" class="ml-3 inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
        A??adir
      </button>
    </div>
  </div>
</form>
</div>
</div>
</div>
{/block}